#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cerrno>

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>


namespace
{

#define RETURN_IF(x) if (-1 == (x)) { return -1; }

ssize_t write_all(int fd, char* buf, size_t count)
{
  char const* pbuf = buf;
  for (;;) {
    ssize_t wsize = write(fd, pbuf, count);
    if (size_t(wsize) == count || wsize <= 0) {
      return wsize ? wsize : (count ? -1 : 0);
    }
    count -= size_t(wsize);
    pbuf += wsize;
  }
}

long long filesize(char const* filename)
{
  struct stat statbuf;
  RETURN_IF(stat(filename, &statbuf));
  return statbuf.st_size;
}

ssize_t read_write(int in, int out, char* buf, size_t count)
{
  const ssize_t rsize = read(in, buf, count);
  RETURN_IF(rsize);
  RETURN_IF(write_all(out, buf, rsize));
  return rsize;
}

int tee(int in, int out, char const* filename, unsigned wait_seconds)
{
  long long fsize = filesize(filename);
  RETURN_IF(fsize);

  constexpr size_t bufmaxsize = 64*1024;
  char buf[bufmaxsize];
  long long total = 0;

  for (;;) {
    if (ssize_t count = fsize - total; count > ssize_t(bufmaxsize)) {
      do {
        ssize_t rsize = read_write(in, out, buf, bufmaxsize);
        printf("%zd/%zu\n", rsize, bufmaxsize);
        if (rsize == 0) {
          rsize = -1;
        }
        RETURN_IF(rsize);
        count -= rsize;
        total += rsize;
      } while (count > ssize_t(bufmaxsize));
    }
    else {
      count = read_write(in, out, buf, size_t(count));
      RETURN_IF(count);
      total += count;
    }

    sleep(wait_seconds);
    fsize = filesize(filename);
    RETURN_IF(fsize);

    if (fsize == total) {
      sleep(10);
      fsize = filesize(filename);
      RETURN_IF(fsize);
      if (fsize == total) {
        break;
      }
    }

    if (fsize < total) {
      fprintf(stderr, "%s: filesize < number of bytes written: %lld < %lld\n",
              filename, fsize, total);
      return -2;
    }
  }

  fprintf(stdout, "total: %lld\n", total);
  return 0;
}

int usage(char const* progname, int errcode)
{
  fprintf(stderr, "%s filename pipename outfilename [wait_seconds=10]\n", progname);
  return errcode;
}

void print_errno(char const* suffix)
{
  fprintf(stderr, "%s: %s\n", suffix, strerror(errno));
}

}

int main(int ac, char** av)
{
  if (ac <= 3) {
    return usage(av[0], 1);
  }

  char const* filename = av[1];
  char const* pipename = av[2];
  char const* outfilename = av[3];
  int wait_seconds = (ac <= 3) ? 10 : atoi(av[4]);

  if (wait_seconds <= 0) {
    fprintf(stderr, "%s: wait_seconds cannot be negative\n", av[0]);
    return usage(av[0], 2);
  }

#define RETURN_ERR(suffix, x) do { \
  if (-1 == (x)) { print_errno(suffix); return -1; } } while (0)

  RETURN_ERR(pipename, mkfifo(pipename, 0600));
  int pipefd = open(pipename, O_RDONLY);
  RETURN_ERR(pipename, pipefd);
  int outfd = open(outfilename, O_CREAT|O_WRONLY, 0644);
  RETURN_ERR(outfilename, outfd);

  int r = tee(pipefd, outfd, filename, wait_seconds);
  if (-1 == r) {
    print_errno(av[0]);
  }

  close(pipefd);
  close(outfd);

  remove(pipename);
  rename(outfilename, pipename);

  return -r;
}
