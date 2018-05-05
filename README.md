Configs
=======

My configuration files

 * zsh
 * bash
 * gdb
 * konsole
 * kde
 * firefox
 * mplayer
 * ...

-----


MIME type
=========

```bash
find mime -exec xdg-mime install {} \;
#update-mime-database ~/.local/usr/share/mime
```

or

```bash
sudo find mime -exec xdg-mime install {} \;
#sudo update-mime-database /usr/share/mime
```


Less binding
============

```bash
lesskey -o ~/.less -
#command
\e[F goto-end
\e[H goto-line
```

https://wiki.archlinux.org/index.php/Home_and_End_keys_not_working


KDE bold fonts does not work
============================

Remove the `Regular` value in `grep ^Font $HOME/.config/k*`.
