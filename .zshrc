# source $ZSH/oh-my-zsh.sh
source $HOME/.bash_aliases
source $HOME/.zsh_profile

# alias showshlvl='PS1="%{$fg_no_bold[yellow]%}[$SHLVL]$PS1"'

# alias prompt_highlighted='PS1="%{$bg_bold[white]%}$PS1"'

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

function _extglob {
  setopt localoptions extendedglob
  local command="$1"
  shift
  if [ "$command" = nocorrect ] ; then
    command="$1"
    shift
  fi
  $==command $==~* # redo globbing on arguments
}
alias extglob='noglob _extglob ' # delay globbing until inside
#ex: extglob echo .(#i)ic*

alias calc='noglob calc'

alias lf='ls *(^/)'
alias lfh='ls -sh *(^/)'

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
alias -g Z='|fzf -m --cycle'

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
alias -g Z2='|fzf -m --cycle'

alias -g C='--color=always'

alias -g @@='|col'
alias -g @1="|awk '{ print \$1 }'"
alias -g @2="|awk '{ print \$2 }'"
alias -g @3="|awk '{ print \$3 }'"
alias -g @4="|awk '{ print \$4 }'"
alias -g @5="|awk '{ print \$5 }'"
alias -g @6="|awk '{ print \$6 }'"
alias -g @7="|awk '{ print \$7 }'"
alias -g @8="|awk '{ print \$8 }'"
alias -g @9="|awk '{ print \$9 }'"

#zstyle ':completion:*' hosts off

_y () {
  youtube-dl --no-part -k --no-mtime --youtube-skip-dash-manifest --merge-output-format none --ffmpeg-location ~/rawdisk --no-playlist "$@"
}
alias y='noglob _y'

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

_insert_pre_cmd_prefix=
_insert_pre_cmd_line_init=
_insert_pre_cmd()
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
zle -N _insert_pre_cmd
bindkey "^@" _insert_pre_cmd

#autoload incremental-complete-word
#zle -N incremental-complete-word
#bindkey '^Xi' incremental-complete-word

_menu_complete_no_autoselect()
{
  unsetopt menu_complete
  zle complete-word
  setopt menu_complete
}
zle -N _menu_complete_no_autoselect
bindkey '^[;' _menu_complete_no_autoselect

function cmdcoloring {
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

  source $HOME/game/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  ZSH_HIGHLIGHT_STYLES+=(
#     default none
#     unknown-token           'fg=red,bold'
#     reserved-word           'fg=green'
#     alias                   'fg=cyan,bold'
#     builtin                 'fg=cyan,bold'
#     function                'fg=cyan'
#     command                 'fg=cyan,bold'
#     hashed-command          'fg=red'
#     precommand              'fg=cyan'
    commandseparator        'fg=blue'
#     path                    'fg=30'
#     globbing                'fg=170,bold'
#     history-expansion       'fg=blue'
    single-hyphen-option    'fg=yellow'
    double-hyphen-option    'fg=red'
#     back-quoted-argument    'fg=green'
#     single-quoted-argument  'fg=yellow,bold'
#     double-quoted-argument  'fg=magenta,bold'
#     dollar-double-quoted-argument 'fg=cyan'
#     back-double-quoted-argument   'fg=cyan'
    assign                  'fg=cyan'
    bracket-error           'fg=cyan,bold'
    bracket-level-1         'fg=green,bold'
    bracket-level-2         'fg=red,bold'
  )
}

loadplugins() {
  source $HOME/game/zsh-history-substring-search/zsh-history-substring-search.zsh

  bindkey '^[k' history-substring-search-up
  bindkey '^[j' history-substring-search-down

  source $HOME/game/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'
}

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$PATH:/home/jonathan/.fzf/bin"
FZF_COMPLETION_TRIGGER=','
source ~/.fzf/shell/completion.zsh
__fsel() {
  setopt localoptions pipefail 2> /dev/null
  find -L . -mindepth 1 \( -path '*/\.*' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3- | \
  fzf --height 40% -m "$@" | while read item; do
    echo -n "${(q)item} "
  done
  return $?
}

fzf-file-widget() {
  LBUFFER="${LBUFFER}$(__fsel)"
  local ret=$?
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle     -N    fzf-file-widget
bindkey '^[' fzf-file-widget

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
