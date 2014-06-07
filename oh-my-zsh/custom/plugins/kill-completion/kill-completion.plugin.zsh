#!/usr/bin/env zsh

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=31=0=34'
zstyle ':completion:*:*:*:*:processes' command "ps -u$USER -o pid,user,comm -w -w"
