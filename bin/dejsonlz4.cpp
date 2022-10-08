// based on https://github.com/avih/dejsonlz4
// clang++ -std=c++17 -Wl,--strip-all -Wl,--gc-sections -fuse-ld=lld -flto -O3 -march=native -mtune=native -s dejsonlz4.cpp -llz4
// g++ -std=c++17 -Wl,--strip-all -Wl,--gc-sections -fwhole-program -fuse-ld=lld -ffat-lto-objects -flto -O3 -s -march=native -mtune=native dejsonlz4.cpp -llz4

#include <memory>
#include <string_view>

#include <cstdio>

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>

#include "lz4.h"


using namespace std::literals;

constexpr auto mozlz4_magic = "mozLz40\0"sv;
constexpr size_t magic_size = mozlz4_magic.size();
constexpr int decomp_size = 4;  /* 4 bytes size come after the header */
constexpr ptrdiff_t offset = magic_size + decomp_size;

int main(int ac, char **av)
{
    if (ac != 2) {
        fputs("Usage: dejsonlz4 IN_FILE\n", stderr);
        return 1;
    }

    char const* fname = av[1];
    struct stat st;
    if (-1 == stat(fname, &st)) {
        return 2;
    }

    size_t const isize = st.st_size;

    auto* const idata = new char[isize];
    std::unique_ptr<char[]> const idata_guard(idata);
    {
        auto const fd = open(fname, O_RDONLY);
        auto const sz = read(fd, idata, isize);
        if (sz == -1 || size_t(sz) != isize) {
            return 3;
        }
        close(fd);

        if (isize < offset || mozlz4_magic != std::string_view(idata, magic_size)) {
            return 4;
        }
    }

    size_t const osize = [idata]{
        auto* p = reinterpret_cast<uint8_t const*>(idata);
        return (p[magic_size + 0] << (8 * 0))
             | (p[magic_size + 1] << (8 * 1))
             | (p[magic_size + 2] << (8 * 2))
             | (p[magic_size + 3] << (8 * 3))
        ;
    }();

    auto* const odata = new char[osize];
    std::unique_ptr<char[]> const odata_guard(odata);

    int const dsize = LZ4_decompress_safe(idata + offset, odata, isize - offset, osize);
    if (dsize < 0)
        return 5;
    if (dsize != osize)
        return 6;

    if (dsize != fwrite(odata, 1, dsize, stdout))
        return 7;
}
