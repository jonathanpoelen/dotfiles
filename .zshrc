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
source $HOME/.zsh_profile

PROMPT='%{$bg[grey]%}%{$fg[cyan]%}%3~%{$reset_color%}!%{$fg_bold[grey]%}%h%(?.%{$fg_no_bold[green]%}.%{$fg[red]%}?%?%{$fg_no_bold[red]%})$%{$reset_color%} '
#PROMPT='%{$bg[black]%}%{$fg_bold[cyan]%}%3~%{$reset_color%}!%{$fg_bold[grey]%}%h%(?.%{$fg[green]%}.%{$fg_no_bold[red]%}?%?%{$fg_bold[red]%})$%{$reset_color%} '
if [ $SHLVL -gt 1 ]; then
  PROMPT='%{$fg[yellow]%}[$SHLVL]'"$PROMPT"
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
export PATH=~/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

#zstyle ':completion:*' hosts off

# copy-prev-arg
# kill-arg

#autoload incremental-complete-word
#zle -N incremental-complete-word
#bindkey '^Xi' incremental-complete-word

function cmdcoloring {
  #ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

  #source ~/game/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source ~/game/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

  #ZSH_HIGHLIGHT_STYLES+=(
  FAST_HIGHLIGHT_STYLES+=(
    # default none
    unknown-token           'fg=red,bold'
    reserved-word           'fg=green'
    # alias                   'fg=cyan,bold'
    # builtin                 'fg=cyan,bold'
    # function                'fg=cyan'
    # command                 'fg=cyan,bold'
    # hashed-command          'fg=red'
    # precommand              'fg=cyan'
    commandseparator        'fg=blue'
    # path                    'fg=30'
    # globbing                'fg=170,bold'
    # history-expansion       'fg=blue'
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
}

loadplugins() {
  source ~/game/zsh-history-substring-search/zsh-history-substring-search.zsh

  bindkey '^[k' history-substring-search-up
  bindkey '^[j' history-substring-search-down

  source ~/game/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'
}

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export PATH="$PATH:/home/jonathan/.fzf/bin"
PATH+=':/home/jonathan/.fzf/bin'
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
