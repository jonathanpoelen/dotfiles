configs
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
