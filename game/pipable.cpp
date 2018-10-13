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

#define RETURN_IF(x) if (-1 == (x)) return -1;

ssize_t write_all(int fd, char* buf, size_t count)
{
  ssize_t wsize;
  char const* pbuf = buf;
  for (;;) {
    wsize = write(fd, pbuf, count);
    if (wsize == -1 || size_t(wsize) == count) {
      break;
    }
    count -= size_t(wsize);
    pbuf += wsize;
  }
  return wsize;
}

off_t filesize(char const* filename)
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
  off_t fsize = filesize(filename);
  char buf[64*1024];
  long long total = 0;

  for (;;) {
    ssize_t count = fsize - total;
    if (count > ssize_t(sizeof(buf))) {
      do {
        ssize_t rsize = read_write(in, out, buf, sizeof(buf));
        RETURN_IF(rsize);
        count -= rsize;
        total += rsize;
      } while (count > ssize_t(sizeof(buf)));
    }
    else {
      sleep(1u);
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
        return 0;
      }
    }
  }

  return 0;
}

int usage(char const* progname, int errcode)
{
  fprintf(stderr, "%s filename pipename outfilename [wait_seconds]\n", progname);
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
    return usage(av[0], 2);
  }

#define RETURN_ERR(suffix, x) do { \
  if (-1 == (x)) { print_errno(suffix); return -1; } } while (0)

  RETURN_ERR(pipename, mkfifo(pipename, 0600));
  int pipefd = open(pipename, O_RDONLY);
  RETURN_ERR(pipename, pipefd);
  int outfd = open(outfilename, O_CREAT|O_WRONLY, 0644);
  RETURN_ERR(outfilename, outfd);

  if (-1 == tee(pipefd, outfd, filename, wait_seconds)) {
    print_errno(av[0]);
  }

  close(pipefd);
  close(outfd);

  remove(pipename);
  rename(outfilename, pipename);

  return 0;
}

