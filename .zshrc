# Path to your oh-my-zsh configuration.
#ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME='jo_link_noir'

# Example aliases
# alias zshconfig='mate ~/.zshrc'
# alias ohmyzsh='mate ~/.oh-my-zsh'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE='true'

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE='true'

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS='true'

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE='true'

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS='true'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git svn screen)
# plugins=()
# plugins=(screen command-coloring)
# plugins=(screen zsh-syntax-highlighting)

DISABLE_CORRECTION='true'
# source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_profile

# alias cmdcoloring="source $ZSH/plugins/command-coloring.plugin.zsh"

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

alias lf='ls *(^/)'
alias lfh='ls -sh *(^/)'

source $HOME/.bash_aliases

# Same color as ls for completion
# eval "$(dircolors -b ~/.dircolors)" # write in .bash_aliases
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# don't complete the same filenames again
zstyle ':completion:*:(rm|cp|mv|ls):*' ignore-line other

alias calc='noglob calc'

alias -g N='>/dev/null'
alias -g N2='2>/dev/null'
alias -g L='|less'
alias -g L2='|&less'
alias -g G='|grep'
alias -g G2='|&grep'
alias -g T='>/rawdisk2/l'
alias -g TT='>/rawdisk2/ll'
alias -g T2='2>/rawdisk2/l'
alias -g TT2='2>/rawdisk2/ll'
alias -g C='--color=always'
alias -g V='|view -'

zstyle ':completion:*' hosts off

function cmdcoloring {
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

  source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
