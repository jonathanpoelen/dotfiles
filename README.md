MIME type
=========

```bash
find mime -type f -exec xdg-mime install {} \;
#update-mime-database ~/.local/usr/share/mime
```

or

```bash
sudo find mime -exec xdg-mime install {} \;
#sudo update-mime-database /usr/share/mime
```


X resources
===========

Load a resource file, and merge with the current settings:

```sh
xrdb -merge ~/.Xresources
```


Less binding
============

```bash
lesskey -o ~/.less -<<EOF
#command
\e[7~ goto-line
\e[8~ goto-end
EOF
```

https://wiki.archlinux.org/index.php/Home_and_End_keys_not_working


KDE bold fonts does not work
============================

Remove the `Regular` value in `grep ^Font $HOME/.config/k*`.


GTK overlay-scrollbar
=====================

`gsettings set org.gnome.desktop.interface overlay-scrolling false`


Ninja
=====

```sh
NINJA_STATUS=$'\x1b[32m[%f/%t] \x1b[0m' CLICOLOR_FORCE= ninja .....
```

Check hard links
================

/!\\ Update repo

```zsh
a=($( stat -c='%h %n' $(<hardlinks) | sed '/^=1 /!d;s/^...//;t;d' )) &&
rm -- $=a &&
for f in $a ; do
  ln -P -- ~/$f $f
done
```

/!\\ Update `$HOME`

```zsh
a=($( stat -c='%h %n' $(<hardlinks) | sed '/^=1 /!d;s/^...//;t;d' )) &&
for f in $a ; do
  rm -- ~/$f && ln -P -- $f ~/$f
done
```


Zsh precompiled
===============

Depends on [zsh_scripts](https://github.com/jonathanpoelen/zsh_scripts).

```zsh
zsh -c "rm -f ~/projects/dotfiles/zsh_funcs/* ||:
ln -P ~/projects/dotfiles/zsh_functions/{def,defl,erd} ~/projects/zsh-scripts/{functions,widgets}/* ~/projects/dotfiles/zsh_funcs/
mv ~/projects/dotfiles/zsh_funcs/extract ~/projects/dotfiles/zsh_funcs/er

autoload zrecompile
zrecompile -p \
  -R ~/.zshrc -- \
  -M ${ZSH_COMPDUMP:-~/.zcompdump} -- \
  ~/.zshcompletions.zwc ~/.zshcompletions/_* -- \
  ~/projects/dotfiles/zsh_funcs.zwc ~/projects/dotfiles/zsh_funcs/*"
```
