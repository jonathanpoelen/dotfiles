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
find mime -type f -exec xdg-mime install {} \;
#update-mime-database ~/.local/usr/share/mime
```

or

```bash
sudo find mime -exec xdg-mime install {} \;
#sudo update-mime-database /usr/share/mime
```


Zsh precompiled
===============

```zsh
zsh -c 'zcompile ~/.zshrc'
zsh -c 'zcompile ~/projects/dotfiles/zsh_functions/*' && mv ~/projects/dotfiles/zsh_functions/*zwc ~/projects/dotfiles/zsh_functions.zwc
zsh -c 'zcompile ~/.zshcompletions/*' && mv ~/.zshcompletions/*zwc ~/.zshcompletions.zwc
zsh -c 'zcompile "${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"'
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


Check hard links
================

```bash
zg -vc '=2*' stat -c='%h %n' $(c hardlinks)
```
