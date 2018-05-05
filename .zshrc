# source $ZSH/oh-my-zsh.sh

# # Apply theming defaults
# PS1="%n@%m:%~%# "
#
# # git theming default: Variables for theming the git info prompt
# ZSH_THEME_GIT_PROMPT_PREFIX="git:("         # Prefix at the very beginning of the prompt, before the branch name
# ZSH_THEME_GIT_PROMPT_SUFFIX=")"             # At the very end of the prompt
# ZSH_THEME_GIT_PROMPT_DIRTY="*"              # Text to display if the branch is dirty
# ZSH_THEME_GIT_PROMPT_CLEAN=""               # Text to display if the branch is clean
#
# Setup the prompt with pretty colors
setopt prompt_subst
#

# Save the location of the current completion dump file.
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
fpath+=(~/.zshcompletions)

# Load and run compinit
autoload -U compinit
compinit -i -d "${ZSH_COMPDUMP}"

source $HOME/.bash_aliases

PROMPT='%{$bg[grey]%}%{$fg[cyan]%}%3~%{$reset_color%}!%{$fg_bold[grey]%}%h%(?.%{$fg_no_bold[green]%}.%{$fg[red]%}?%?%{$fg_no_bold[red]%})$%{$reset_color%} '
#PROMPT='%{$bg[black]%}%{$fg_bold[cyan]%}%3~%{$reset_color%}!%{$fg_bold[grey]%}%h%(?.%{$fg[green]%}.%{$fg_no_bold[red]%}?%?%{$fg_bold[red]%})$%{$reset_color%} '
if [ $SHLVL -gt 3 ]; then
  PROMPT='%{$fg[yellow]%}[$(($SHLVL-3))]'"$PROMPT"
fi
if [ "$USER" = root ]; then
  PROMPT='%{$fg_bold[red]%}root%{$fg_no_bold[green]%}@%{$fg[yellow]%}%m%{$fg_bold[magenta]%}:'"$PROMPT"
fi

# RPROMPT='%{$fg[red]%}%6~$(git_prompt_info)$(svn_prompt_info)%{$reset_color%}'
# RPROMPT='%{$fg[red]%}%6~%{$reset_color%}'
PS2='%{$fg[green]%}>%{$reset_color%}'

# alias showshlvl='PS1="%{$fg_no_bold[yellow]%}[$SHLVL]$PS1"'

# alias prompt_highlighted='PS1="%{$bg_bold[white]%}$PS1"'

# Customize to your needs...
# export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export PATH=~/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/bin/vendor_perl

#zstyle ':completion:*' hosts off

# copy-prev-arg
# kill-arg

#autoload incremental-complete-word
#zle -N incremental-complete-word
#bindkey '^Xi' incremental-complete-word

#function cmdcoloring {
  #ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

  # source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source ~/game/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

  #ZSH_HIGHLIGHT_STYLES+=(
  FAST_HIGHLIGHT_STYLES+=(
    # default none
    unknown-token           'fg=red,bold'
    reserved-word           'fg=green'
    alias                   'fg=cyan,bold'
    builtin                 'fg=cyan,bold'
    function                'fg=cyan'
    command                 'fg=cyan,bold'
    hashed-command          'fg=red'
    precommand              'fg=cyan'
    commandseparator        'fg=blue'
    # path                    'fg=32'
    path                    'fg=173'
    globbing                'fg=170,bold'
    history-expansion       'fg=blue'
    single-hyphen-option    'fg=yellow'
    double-hyphen-option    'fg=red'
    back-quoted-argument    'fg=green'
    single-quoted-argument  'fg=yellow,bold'
    double-quoted-argument  'fg=magenta'
    dollar-double-quoted-argument 'fg=cyan'
    back-double-quoted-argument   'fg=cyan'
    assign                  'fg=cyan'
    bracket-error           'fg=cyan,bold'
    bracket-level-1         'fg=green,bold'
    bracket-level-2         'fg=red,bold'
  )
#}

#loadplugins() {
  source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

  bindkey '^[K' history-substring-search-up
  bindkey '^[J' history-substring-search-down

  #source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  #ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
  # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8
  #ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'
#}

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export PATH="$PATH:/home/jonathan/.fzf/bin"
#PATH+=':/home/jonathan/.fzf/bin'
#FZF_COMPLETION_TRIGGER=','
#source ~/.fzf/shell/completion.zsh
__fsel() {
  setopt localoptions pipefail 2> /dev/null
  find -L ${2-.} -mindepth 1 \( -path '*/\.*' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \) -prune \
    -o -type d -print $=1 2> /dev/null | cut -b$([ -z "$2" ] && echo 3 || echo 1)- | \
  fzf --height 40% --reverse --cycle -m $=3 | while read item; do
    echo -n "${(q)item} "
  done
  return $?
}

_fzf_file_or_directory() {
  if [ "${LBUFFER[-1]}" = ' ' ] ; then
    LBUFFER="${LBUFFER}$(__fsel "$1")"
  else
    local tail=${${(z)LBUFFER}[-1]}
    if [ "${tail[-1]}" = '/' ] ; then
      LBUFFER="${LBUFFER:0:-${#tail}}$(__fsel "$1" ${~tail})"
    else
      if [ -d "${tail:h}" ] ; then
        LBUFFER="${LBUFFER:0:-${#tail}}$(__fsel "$1" ${~tail:h} "-q ${tail:t:q}")"
      else
        LBUFFER="${LBUFFER}$(__fsel "$1")";
      fi
    fi
  fi
  local ret=$?
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
fzf-file-widget () { _fzf_file_or_directory '-o -type f -print -o -type l -print' ; }
fzf-directory-widget () { _fzf_file_or_directory '' ; }
zle     -N    fzf-file-widget
bindkey ^\[\' fzf-file-widget
zle     -N    fzf-directory-widget
bindkey '^[;' fzf-directory-widget

fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst pipefail 2> /dev/null
  selected=( $(fc -l 1 |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS +s --tac -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(q)LBUFFER} +m" fzf) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle     -N   fzf-history-widget
bindkey '^[r' fzf-history-widget

alias history='fc -l 1'

# alias afind='ack-grep -il'


## completion

setopt menu_complete   # autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

WORDCHARS=''

zmodload -i zsh/complist

# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completio
# zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[_[:lower:]]=** r:|[_[:upper:]]=** r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|[_[:lower:]]=** r:|[_[:upper:]]=** r:|=*' 'l:|=* r:|=*'

# zstyle ':completion:*' list-colors ''

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=31=0=34'
zstyle ':completion:*:*:killall:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=31=0=34'
zstyle ':completion:*:*:*:*:processes' command "ps -u$USER -o pid,user,comm -w"

zstyle ':completion:*:er:*' file-patterns '*(7z|Z|bz2|gz|lzma|rar|tar|tar.bz2|tar.gz|tar.xz|tar.zma|tbz|tbz2|tgz|tlz|txz|zip|deb|cbr|cbz|jar) *(-/)'
#compdef "_files -g '(#i)*.(7z|Z|bz2|gz|lzma|rar|tar|tar.bz2|tar.gz|tar.xz|tar.zma|tbz|tbz2|tgz|tlz|txz|zip)(-.)'" extract

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)

# use /etc/hosts and known_hosts for hostname completion
# [ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _global_ssh_hosts=()
# [ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
# [ -r ~/.ssh/config ] && _ssh_config=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p')) || _ssh_config=()
# [ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
# hosts=(
#   "$_ssh_config[@]"
#   "$_global_ssh_hosts[@]"
#   "$_ssh_hosts[@]"
#   "$_etc_hosts[@]"
#   "$HOST"
#   localhost
# )
# zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*' users off

zstyle ':completion:*' accept-exact '*(N)'
# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::*' use-cache 1
zstyle ':completion::*' cache-path ~/rawdisk/zsh_cache/

# Don't complete uninteresting users
# zstyle ':completion:*:*:*:users' ignored-patterns \
#         adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
#         dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
#         hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
#         mailman mailnull mldonkey mysql nagios \
#         named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
#         operator pcap postfix postgres privoxy pulse pvm quagga radvd \
#         rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

# ... unless we really want to.
zstyle '*' single-ignored show

# Same color as ls for completion
# eval "$(dircolors -b ~/.dircolors)" # writing in .bash_aliases
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# don't complete the same filenames again
zstyle ':completion:*:(rm|cp|mv|ls):*' ignore-line other


## correction

alias man='nocorrect man'
alias mv='nocorrect mv'
#alias mysql='nocorrect mysql'
alias mkdir='nocorrect mkdir'
# alias gist='nocorrect gist'
# alias heroku='nocorrect heroku'
# alias ebuild='nocorrect ebuild'
# alias hpodder='nocorrect hpodder'
alias sudo='nocorrect sudo'

# if [[ "$ENABLE_CORRECTION" == "true" ]]; then
#   setopt correct_all
# fi


## directories

# Changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

#alias ..='cd ..'

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'


## aliases

function _ext-glob {
  setopt localoptions extendedglob
  local command="$1"
  shift
  if [ "$command" = nocorrect ] ; then
    command="$1"
    shift
  fi
  $==command $==~* # redo globbing on arguments
}
alias extglob='noglob _ext-glob ' # delay globbing until inside
#ex: extglob echo .(#i)ic*

function _nocase-glob {
  setopt localoptions nocaseglob
  local command="$1"
  shift
  if [ "$command" = nocorrect ] ; then
    command="$1"
    shift
  fi
  $==command $==~* # redo globbing on arguments
}
alias ix='noglob _nocase-glob'
alias ex=extglob

alias calc='noglob calc'
alias wg='noglob wget'
alias y='noglob y'

alias lf='ls *(^/)'
alias lfh='ls -sh *(^/)'


## global aliases

alias -g N='>/dev/null'
alias -g T='>~/rawdisk2/l'
alias -g TT='>~/rawdisk2/ll'
alias -g ZT='|fzf -m --cycle>~/rawdisk2/l'

alias -g V='|view -'
alias -g L='|less'
alias -g G='|grep'
alias -g S='|sed'
alias -g K='|k'
alias -g A='|awk'
alias -g W='|while read'
alias -g X='|xargs -d\\n'
alias -g Z='|fzf --height 40% --cycle --reverse --no-sort -m --ansi --tiebreak=index --no-sort'

alias -g N2='2>/dev/null'
alias -g T2='2>~/rawdisk2/l'
alias -g TT2='2>~/rawdisk2/ll'
alias -g ZT2='|fzf -m --cycle 2>~/rawdisk2/l'

alias -g V2='|&view -'
alias -g L2='|&less'
alias -g G2='|&grep'
alias -g S2='|&sed'
alias -g K2='|&k'
alias -g A2='|&awk'
alias -g W2='|&while read'
alias -g X2='|&xargs -d\\n'
alias -g Z2='|&fzf -m --cycle --reverse --no-sort -m --ansi --tiebreak=index --no-sort'

alias -g C='--color=always'
alias -g ZF='|fo'

#alias -g @@='|col'
alias -g @1="|awk '{ print \$1 }'"
alias -g @2="|awk '{ print \$2 }'"
alias -g @3="|awk '{ print \$3 }'"
#alias -g @4="|awk '{ print \$4 }'"
#alias -g @5="|awk '{ print \$5 }'"
#alias -g @6="|awk '{ print \$6 }'"
#alias -g @7="|awk '{ print \$7 }'"
#alias -g @8="|awk '{ print \$8 }'"
#alias -g @9="|awk '{ print \$9 }'"


## functions

#function zsh_stats() {
#  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
#}

function fo {
  local fs=()
  fzf --height 40% --cycle --reverse --no-sort -m -n3..,1 -d: --ansi --tiebreak=index | while read l; do fs+=($l); done
  eval "$@" ${(q)fs/:*/}
}

function gfo {
  local cmd=$1
  shift
  g -nH --color=always "$@" |fo $cmd
}

## history

## Command history configuration
# if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zhistory
# fi
HISTSIZE=10000
SAVEHIST=10000

# setopt correct
setopt nocaseglob
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data


## key-bindings

# should this be in keybindings?
bindkey -M menuselect '^o' accept-and-infer-next-history

bindkey -e
bindkey '\ew' kill-region
bindkey '^r' history-incremental-search-backward
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history

# make search up and down work, so partially type and hit up/down to find relevant stuff
# bindkey "${key[Up]}" up-line-or-search
# bindkey "${key[Down]}" down-line-or-search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# bindkey '^[[H' beginning-of-line
# bindkey '^[[1~' beginning-of-line
# bindkey '^[OH' beginning-of-line
bindkey "^[[7~" beginning-of-line
# bindkey '^[[F'  end-of-line
# bindkey '^[[4~' end-of-line
# bindkey '^[OF' end-of-line
bindkey "^[[8~" end-of-line
bindkey ' ' magic-space    # also do history expansion on space

bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
# bindkey '^[Oc' forward-word
# bindkey '^[Od' backward-word

bindkey '^[[Z' reverse-menu-complete
bindkey '^[i'  reverse-menu-complete

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey '^[[3~'  delete-char
# bindkey '^[3;5~' delete-char
# bindkey '\e[3~'  delete-char

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

#_accept_and_menu() {
#  zle menu-select
#  zle menu-complete
#}
#zle -N _accept_and_menu
#bindkey '^[o' _accept_and_menu
bindkey '^[o' menu-select
# bindkey '^[o' menu-complete

# Cycle through history based on characters already typed on the line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[1;5A' up-line-or-beginning-search
bindkey '^[[1;5B' down-line-or-beginning-search
#bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
#bindkey "$terminfo[kcud1]" down-line-or-beginning-search

# Cycle through globs choices, one at a time.  Bound to '^n' below.
_cycle-glob ()
{
  setopt local_options glob_complete
  zle menu-complete
}
zle -N _cycle-glob
bindkey '^[e' _cycle-glob

_menu_complete_no_autoselect()
{
  unsetopt menu_complete
  zle complete-word
  setopt menu_complete
}
zle -N _menu_complete_no_autoselect
bindkey '^[k' _menu_complete_no_autoselect


_popd()
{
  popd > /dev/null
  zle reset-prompt
}

_pushd()
{
  pushd .. > /dev/null
  zle reset-prompt
}

_list-dir()
{
  BUFFER+=' *(/)'
  CURSOR+=5
  zle _cycle-glob
}

_list-file()
{
  BUFFER+=' *(^/)'
  CURSOR+=6
  zle _cycle-glob
}

zle -N _popd
zle -N _pushd
zle -N _list-dir
zle -N _list-file
bindkey '^[[1;3B' _popd
bindkey '^[[1;3A' _pushd
bindkey '^[[1;3C' _list-dir
bindkey '^[[1;3D' _list-file

# see split-shell-arguments and replace-argument

goto-previous-arg()
{
  local a=()
  a+=(${(z)LBUFFER})
  CURSOR=$(($CURSOR-${#${a[-1]}}-1))
}

goto-next-arg()
{
  local a=()
  a+=(${(z)RBUFFER})
  CURSOR=$(($CURSOR+${#${a[1]}}+1))
}

kill-arg()
{
  local reply REPLY REPLY2 n=2
  autoload -U split-shell-arguments
  split-shell-arguments
  [ $(($REPLY % 2)) -eq 1 ] && n=3
  RBUFFER="${(j::)reply[$(($REPLY+$n)),-1]}"
}

transpose-arg()
{
  local reply REPLY REPLY2 tmp e=0
  autoload -U split-shell-arguments
  split-shell-arguments
  if [ $REPLY -eq 1 ]; then
    e=$((${#reply[1]}+${#reply[2]}))
    REPLY=4
  elif [ $REPLY -eq 2 ]; then
    e=${#reply[2]}
    REPLY=4
  elif [ $(($REPLY % 2)) -eq 1 ]; then
    [ ${#reply} -eq $REPLY ] && REPLY=$(($REPLY-1)) || REPLY=$(($REPLY+1))
  else
    e=$((-${#reply[$(($REPLY-1))]}))
  fi
  tmp=${reply[$REPLY]}
  reply[$REPLY]=${reply[$(($REPLY-2))]}
  reply[$(($REPLY-2))]=$tmp
  BUFFER="${(j::)reply}"
  CURSOR=$(($CURSOR-$REPLY2+${#reply[$(($REPLY-2))]}+${#reply[$((REPLY-1))]}+${#reply[$((REPLY+1))]}+$e+1))
}

zle -N goto-previous-arg
zle -N goto-next-arg
zle -N kill-arg
zle -N transpose-arg
bindkey '^[^B' goto-previous-arg
bindkey '^[^F' goto-next-arg
bindkey '^[^K' kill-arg
bindkey '^[^T' transpose-arg

#_inc_last_arg() {
#  local r=${BUFFER/* }
#  [ '}' = "${r[${#r}]}" ] && r=${r/\{*}${${r/*..}:0:-1}
#  local n=$((${r//[^0-9]/}+1))
#  [ ! -z "$NUMERIC" ] && n="{$n..$NUMERIC}"
#  BUFFER=${BUFFER% *}' '$n
#  CURSOR=$#BUFFER
#}
#zle -N _inc_last_arg
#bindkey "^[=" _inc_last_arg
# autoload -U incarg
# zle -N incarg

#precmd_functions[n]=function
_insert_pre_cmd_prefix=
_insert_pre_cmd_line_init=
prefix-cmd-widget()
{
  if [ ! -z "$_insert_pre_cmd_prefix" ] ; then
    eval "zle-line-init () { $_insert_pre_cmd_line_init }"
    _insert_pre_cmd_prefix=
  fi
  if [ ! -z "$BUFFER" ] ; then
    _insert_pre_cmd_prefix=$LBUFFER
    _insert_pre_cmd_line_init=$functions[zle-line-init]
    eval "zle-line-init () {
      $_insert_pre_cmd_line_init
      if [ -z \"\$BUFFER\" ] ; then
        BUFFER=\$_insert_pre_cmd_prefix
        CURSOR=\${#BUFFER}
      fi
    }"
  fi
}
zle -N prefix-cmd-widget
bindkey '^[^@' prefix-cmd-widget

bindkey '^@' set-mark-command

# consider emacs keybindings:

#bindkey -e  ## emacs key bindings
#
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#bindkey '^[^[[C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
#
#bindkey -s '^X^Z' '%-^M'
#bindkey '^[e' expand-cmd-path
#bindkey '^[^I' reverse-menu-complete
#bindkey '^X^N' accept-and-infer-next-history
#bindkey '^W' kill-region
#bindkey '^I' complete-word
## Fix weird sequence that rxvt produces
#bindkey -s '^[[Z' '\t'
#

_jln-pick ()
{
  autoload -U read-from-minibuffer
  read-from-minibuffer 'command: '
  [ -z "$REPLY" ] && return

  local buf=$(eval "$REPLY" Z)
  [ -z "$buf" ] && return

  if [ "$1" = 2 ]; then
    # sed '1,3!d' <<<$buf
    echo output: ${buf/$'\n'*}
    read-from-minibuffer 'filter: '
    buf=$(echo "$buf" | eval $REPLY)
  fi

  if [ ! -z $1 ]; then
    buf=(${(q)${(f)buf}})
    LBUFFER+="${(j: :)buf}"
    zle redisplay
    return
  fi

  local -a view=()
  local -i len n
  local l
  n=0
  while read -A a ; do
    [[ $n > 4 ]] && break
    ((++n))
    len=$#a;
    for (( i=1 ; i <= $len ; ++i)); do
      [ -z "${view[$i]}" ] && view[$i]="\e[32m$i\e[0m: "
      view[$i]+="${(q)a[$i]}  "
    done
  done <<<"$buf"
 
  local ns=$(echo ${(j:\n:)view} Z | sed 's/:.*//' )
  buf=(${(f)buf})
  ns=(${(f)ns})
  len=$#buf
  for (( i=1 ; i <= $len ; ++i )); do
    view=(${(z)buf[$i]})
    for n in $ns ; do
      LBUFFER+="${(q)view[$n]} "
    done
  done
  zle redisplay
}
_jln-pick-line () { _jln-pick 1 }
_jln-pick-line-col () { _jln-pick 2 }
zle -N _jln-pick
zle -N _jln-pick-line
zle -N _jln-pick-line-col
bindkey '^[&' _jln-pick
bindkey '^[|' _jln-pick-line
bindkey '^[ç' _jln-pick-line-col

## misc

## smart urls
# autoload -U url-quote-magic
# zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
# setopt long_list_jobs

## pager
export PAGER="less"
export LESS="-iRj3"

export LC_CTYPE=$LANG


## theme-and-apparence

autoload colors; colors;

#setopt no_beep
setopt auto_cd
# setopt multios
# setopt cdablevarS
#
# if [[ x$WINDOW != x ]]
# then
#     SCREEN_NO="%B$WINDOW%b "
# else
#     SCREEN_NO=""
# fi

smart_sudo () {
  if [[ -n $1 ]]; then
    if [[ $1 == \-* ]]; then
      command sudo $@
    else
      local prevwhat what prefix='' exargs=() i nocorrect= g=

      while [ 1 ]; do
        case $1 in
          nocorrect) nocorrect=1; shift;;
          noglob) prefix+=$1' '; g=1; shift;;
          ex|extglob) prefix+='noglob _ext-glob '; g=1; shift;;
          ix) prefix+='noglob _nocase-glob '; g=1; shift;;
          *) break;;
        esac
      done

      while [ 1 ]; do
        # what=$(builtin whence $1)
        what=$aliases[$1]
        [[ $prevwhat == $what ]] && break
        [[ $1 == $what ]] && break
        [[ -z $what ]] && break
        i=1;
        while [ 1 ]; do
          case ${what[(w)$i]} in
            nocorrect) nocorrect=1; ((++i)) ;;
            noglob) prefix+=${what[(w)$i]}' '; g=1; ((++i));;
            ex|extglob) prefix+='noglob _ext-glob '; g=1; ((++i));;
            ix) prefix+='noglob _nocase-glob '; g=1; ((++i));;
            *) break;;
          esac
        done

        1=${what[(w)$i]}
        [[ $i < ${(w)#what} ]] && exargs=(${what[(w)$(($i+1)),-1]} $exargs)
        prevwhat=$what
      done
      
      if [[ -z $g ]]; then
        if [[ -z $nocorrect ]]; then
          $=prefix command sudo $1 ${==~exargs} ${==~@[2,-1]}
        else
          nocorrect $=prefix command sudo $1 ${==~exargs} ${==~@[2,-1]}
        fi
      else
        if [[ -z $nocorrect ]]; then
          $=prefix command sudo $1 $exargs ${@[2,-1]}
        else
          nocorrect $=prefix command sudo $1 $exargs ${@[2,-1]}
        fi
      fi
    fi
  else
    #if no parameters were given, then assume we want a root shell
    command sudo -s
  fi
}

alias sudo='nocorrect noglob smart_sudo'
compdef _sudo smart_sudo

insert-sudo-and-accept() {
  [[ -z $BUFFER ]] && zle up-history
  if [[ $BUFFER == sudo\ * ]] || [[ $BUFFER == \ sudo\ * ]]; then
     LBUFFER="${LBUFFER:5}"
  #elif [[ $BUFFER == $EDITOR\ * ]]; then
  #    LBUFFER="sudoedit ${LBUFFER#$EDITOR }"
  #elif [[ $BUFFER == sudoedit\ * ]]; then
  #    LBUFFER="$EDITOR ${LBUFFER#sudoedit }"
  elif [[ $BUFFER == \ * ]]; then
     LBUFFER=" sudo$LBUFFER"
  else
     LBUFFER="sudo $LBUFFER"
  fi
}
zle -N insert-sudo-and-accept
bindkey "\e\e" insert-sudo-and-accept

insert-space-and-accept() {
  [[ -z $BUFFER ]] && zle up-history
  if [[ $BUFFER != \ * ]]; then
     LBUFFER=" $LBUFFER"    
  fi
  zle accept-line
}
zle -N insert-space-and-accept
bindkey "^[j" insert-space-and-accept

alias clipcopy='xclip -selection clipboard'

copybuffer () {
  echo -n $BUFFER | clipcopy
}
zle -N copybuffer
#bindkey "^[o" copybuffer

b() { LD_PRELOAD=$HOME/lib/qt5noblink.so kate ~/projects/blog/content/post/"$@" }
bb() { LD_PRELOAD=$HOME/lib/qt5noblink.so kdevelop ~/projects/blog/content/post/"$@" }
_blog_file_completion () { local a=(~/projects/blog/content/post/*(om)) ; reply=(${a:t}) }
compctl -K _blog_file_completion -M 'r:|[_[:lower:]]=** r:|=*' b bb

rand() REPLY=$RANDOM
