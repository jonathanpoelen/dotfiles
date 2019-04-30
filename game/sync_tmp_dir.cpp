// cw17 sync_tmp_dir.cpp -stdlib=libc++ -lc++fs -DNDEBUG -O3 -flto -fuse-ld=gold -Wl,--gc-sections -Wl,--strip-all
#include <filesystem>
#include <vector>
#include <algorithm>
#include <fstream>
#include <string_view>
#include <iterator>
#include <iostream>

namespace fs = std::filesystem;

using std::begin;
using std::end;

namespace
{

struct File{ std::time_t t; fs::path path; };

std::ostream& operator<<(std::ostream& out, File const& f)
{
  return out << f.t << ' ' << f.path;
}

std::istream& operator>>(std::istream& in, File& f)
{
  return in >> f.t >> f.path;
}

inline constexpr auto by_path = [](auto& a, auto& b) { return a.path > b.path; };
// inline constexpr auto by_time = [](auto& a, auto& b) { return a.t < b.t; };

std::time_t to_time_t(fs::file_time_type const& ftime)
{
  return fs::file_time_type::clock::to_time_t(ftime);
}

template<class F>
void read_directory(char const* d, F&& f)
{
  for(auto& p: fs::recursive_directory_iterator(d)) {
    auto ftime = fs::last_write_time(p);
    f(File{to_time_t(ftime), p.path()});
  }
}

template<class F>
struct output_iterator
{
  F f;

  struct Proxy
  {
    F& f;
    template<class T>
    void operator=(T&& x)
    {
      f(static_cast<T&&>(x));
    }
  };

  output_iterator& operator++()
  {
    return *this;
  }

  Proxy operator*()
  {
    return Proxy{f};
  }
};

template<class F>
output_iterator(F) -> output_iterator<F>;


int usage()
{
  std::cout <<
    "-r dir output_file\n"
    "-u dir output_file original_dir\n"
  ;
  return 1;
}

}

template<class F>
struct std::iterator_traits<output_iterator<F>>
{
  using value_type = typename output_iterator<F>::Proxy;
};

int main(int ac, char** av)
{
  if (ac <= 3) return usage();

  char const* current_directory = av[2];
  char const* backup_file = av[3];

  using namespace std::literals;

  if (av[1] == "-r"sv)
  {
    if (ac != 4)
    {
      return usage();
    }

    std::ofstream out{backup_file};
    out.exceptions(std::ios::failbit | std::ios::badbit);
    out << to_time_t(fs::file_time_type::clock::now()) << '\n';
    read_directory(current_directory, [&](auto&& f){
      out << f << '\n';
    });
    out.flush();
  }
  else if (av[1] == "-u"sv)
  {
    if (ac != 5)
    {
      return usage();
    }

    char const* original_path_directory = av[4];

    std::vector<File> previous_files;
    std::time_t previous_time;
    {
      std::ifstream in{backup_file};
      in >> previous_time;
      while (in)
      {
        in >> previous_files.emplace_back();
      }

      if (!in.eof())
      {
        return 52;
      }

      previous_files.pop_back();
    }

    std::vector<File> current_files;
    read_directory(current_directory, [&](auto&& f){
      current_files.emplace_back(std::move(f));
    });

    std::sort(begin(current_files), end(current_files), by_path);
    std::sort(begin(previous_files), end(previous_files), by_path);

    fs::path const original_path = original_path_directory;

    std::cout.sync_with_stdio(false);

    // propagate removed files

    std::set_difference(
      begin(previous_files), end(previous_files),
      begin(current_files), end(current_files),
      output_iterator{[&](auto& f){
        auto p = original_path/f.path;
        std::cout << "\x1b[37mremove:\x1b[0m " << p << "\n";
        std::error_code ec;
        fs::remove(p, ec);
        if (ec)
        {
          fs::remove_all(p, ec);
          if (ec)
          {
            std::cout << "\x1b[1;31merror:\x1b[0m " << ec.message() << "\n";
          }
        }
      }},
      by_path
    );

    // copy updated files

    // {dir/file, dir} -> {dir, dir/file}
    std::reverse(begin(current_files), end(current_files));
    for (auto&& f : current_files)
    {
      if (f.t >= previous_time)
      {
        auto newpath = original_path/f.path;
        std::error_code ec;
        if (fs::is_directory(f.path))
        {
          if (!fs::is_directory(newpath))
          {
            std::cout << "\x1b[33mcreate directory:\x1b[0m " << f.path << "\n";
            fs::create_directory(newpath, ec);
          }
        }
        else
        {
          std::cout << "\x1b[33mcopy:\x1b[0m " << f.path << "\n";
          fs::copy_file(f.path, newpath, fs::copy_options::overwrite_existing, ec);
        }

        if (ec)
        {
          std::cout << "\x1b[1;31merror:\x1b[0m " << ec.message() << "\n";
        }
      }
    }

    std::ofstream out{backup_file};
    out.exceptions(std::ios::failbit | std::ios::badbit);
    out << to_time_t(fs::file_time_type::clock::now()) << '\n';
    for (auto const& f : current_files)
    {
      out << f << '\n';
    }
  }
  else
  {
    return usage();
  }

  return 0;
}
