set -o pipefail

setopt prompt_subst nobeep auto_cd
# setopt multios
# setopt cdablevarS
#

export EDITOR=nano
export LESS=-iRj3
export PAGER=less
export TMPDIR=~/rawdisk
export RLWRAP_HOME=~/.rlwrap
export CMAKE_GENERATOR=Ninja

[[ $TERM = rxvt-unicode ]] && TERM=xterm-256color

#if [[ -x /usr/bin/dircolors ]]; then
  # test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  export LS_COLORS='bd=38;5;68:ca=38;5;17:cd=38;5;113;1:di=38;5;68;4:do=38;5;127:ex=38;5;166;1:'\
'pi=38;5;126:fi=38;5;252:ln=target:mh=38;5;220;1:or=48;5;160;38;5;232;1:ow=38;5;220;1:'\
'sg=48;5;234;38;5;100;1:su=38;5;137:so=38;5;197:st=38;5;86;48;5;234:tw=48;5;235;38;5;139;3:'\
'*LS_COLORS=48;5;89;38;5;197;1;3;4;7:*.BAT=38;5;108:*.PL=38;5;167:*.asm=38;5;240;1:'\
'*.awk=38;5;148;1:*.bash=38;5;173:*.bat=38;5;108:*.c=38;5;110:*.cc=38;5;178:*.cfg=1:*.conf=1:'\
'*rc=1:*.cl=38;5;204;1:*.cpp=38;5;178:*.cxx=38;5;178:*.ii=38;5;178:*.css=38;5;135:*.csv='\
'38;5;78:*.diff=48;5;197;38;5;232:*.example=38;5;225;1:*.git=38;5;197:*.gitignore=38;5;240:'\
'*.gitattributes=38;5;240:*.go=38;5;36;1:*.h=38;5;81:*.hpp=38;5;81:*.hxx=38;5;81:*.tcc=38;5;81:'\
'*.s=38;5;81:*.S=38;5;81:*.gpg=38;5;192;3:*.htm=38;5;125;1:*.html=38;5;125;1:*.info=38;5;101:'\
'*.ini=38;5;122:*.java=38;5;142;1:*.js=38;5;42:*.json=38;5;199:*.log=38;5;190:*.lua=38;5;34;1:'\
'*.markdown=38;5;184:*.md=38;5;184:*.nfo=38;5;220:*.o=38;5;240:*.pacnew=38;5;33:*.patch='\
'48;5;197;38;5;232;1:*.pgp=38;5;192;3:*.pgsql=38;5;222:*.php=38;5;170:*.pl=38;5;214:*.pm='\
'38;5;197;1:*.pod=38;5;172;1:*.py=38;5;41:*.pyc=38;5;240:*.rb=38;5;192:*.rdf=38;5;144:*.rst='\
'38;5;67:*.sed=38;5;130;1:*.sh=38;5;113:*.sig=38;5;192;3:*.sql=38;5;222:*.srt=38;5;116:*.sty='\
'38;5;58:*.tcl=38;5;64;1:*.tex=38;5;172:*.textile=38;5;106:*.theme=38;5;109:*.txt=38;5;186:'\
'*.urlview=38;5;85:*.vim=1:*.viminfo=38;5;240;1:*.xml=38;5;199:*.yml=38;5;208:*.zsh=38;5;173:'\
'*README=38;5;220;1:*Makefile=38;5;160:*MANIFEST=38;5;243:*.1=38;5;160;1:*.3=38;5;160;1:*.7='\
'38;5;160;1:*.am=38;5;242:*.in=38;5;242:*.old=38;5;242:*.out=38;5;46;1:*.bmp=38;5;62:*.gif='\
'38;5;72:*.ico=38;5;73:*.jpeg=38;5;66:*.jpg=38;5;66:*.JPG=38;5;66:*.png=38;5;30:*.svg=38;5;132:'\
'*.webp=38;5;36:*.gb=38;5;203:*.gba=38;5;205:*.gbc=38;5;204:*.nds=38;5;193:*.nes=38;5;167:*.rom='\
'38;5;59;1:*.sav=38;5;220:*.sms=38;5;33:*.st=38;5;208;1:*.iso=38;5;15:*.avi=38;5;114:*.divx='\
'38;5;112:*.flv=38;5;131:*.m2v=38;5;166:*.mkv=38;5;202:*.mov=38;5;42:*.mp4=38;5;15:*.mpg='\
'38;5;38:*.mpeg=38;5;38:*.ogm=38;5;97:*.ogv=38;5;94:*.sample=38;5;130;1:*.ts=38;5;39:*.vob='\
'38;5;137:*.webm=38;5;109:*.wmv=38;5;113:*.aac=38;5;137:*.dat=38;5;165:*.flac=38;5;166;1:*.m3u='\
'38;5;172:*.m3u8=38;5;172:*.m4=38;5;160;3:*.m4a=38;5;137;1:*.mid=38;5;102:*.midi=38;5;102:'\
'*.mod=38;5;72:*.mp3=38;5;185:*.oga=38;5;95:*.ogg=38;5;96:*.s3m=38;5;71;1:*.sid=38;5;69;1:'\
'*.ttf=38;5;66:*.bak=38;5;41;1:*.bin=38;5;249:*.pid=38;5;167:*.state=38;5;15:*.swp=38;5;241:'\
'*.tmp=38;5;244:*.zcompdump=38;5;240:*.zwc=38;5;240:*.db=48;5;233;38;5;60;1;3:*.dump=38;5;118:'\
'*.sqlite=48;5;233;38;5;60;1:*.localstorage=48;5;233;38;5;60;1;3:*.7z=38;5;40:*.a=38;5;46:'\
'*.apk=38;5;172;3:*.bsp=38;5;239;1:*.bz2=38;5;44:*.deb=38;5;215:*.gz=38;5;34:*.jar=38;5;51:'\
'*.nth=38;5;40:*.part=38;5;239;1:*.rar=38;5;106;1:*.tar=38;5;119:*.tgz=38;5;35;1:*.xz=38;5;118:'\
'*.zip=38;5;41:*.pdf=38;5;203:*.djvu=38;5;141:*.cbr=38;5;140:*.cbz=38;5;140:*.chm=38;5;145:'\
'*.epub=38;5;144:*.odt=38;5;111:*.docx=38;5;111:*.docm=38;5;111;4:*.ppt=38;5;166:*.pot='\
'38;5;166:*.pps=38;5;166:*.allow=38;5;112:*.deny=38;5;160:*.SKIP=38;5;244:*.def=38;5;31:'\
'*.directory=38;5;83:*.err=38;5;167;1:*.error=38;5;167;1:*.pi=38;5;126:*.properties=38;5;197;1:'\
'*.torrent=38;5;58:*.tg=38;5;99:*.gbr=38;5;2:*.pcb=38;5;28:*.pcap=38;5;29:*.cap=38;5;29:'\
'*.service=38;5;81:*@.service=38;5;45:*.socket=38;5;75:*.device=38;5;24:*.mount=38;5;115:'\
'*.automount=38;5;114:*.swap=38;5;113:*.target=38;5;73:*.path=38;5;116:*.timer=38;5;111:'\
'*.snapshot=38;5;139:*.ninja=38;5;160:*.build=38;5;186'
  alias ls='ls --color=auto'
  alias grep='grep --color=auto --exclude-dir=.git'
  GREP_COLORS='ms=1;31:ne'
#fi


# Save the location of the current completion dump file.
fpath=(~/projects/dotfiles/zsh_funcs ~/.zshcompletions $fpath)

# Load and run compinit
autoload -U compinit
compinit -i -d "${ZSH_COMPDUMP}"

# autoload bashcompinit
# bashcompinit

# /usr/share/zsh/site-functions/_delta should also be removed (installed by git-delta)
_comps[delta]=_delta


PROMPT='%{$bg[grey]%}%{$fg[cyan]%}%3~%{$reset_color%}!%{$fg_bold[grey]%}%h%(?.%{$fg_no_bold[green]%}.%{$fg[red]%}?%?%{$fg_no_bold[red]%})$%{$reset_color%} '
#PROMPT='%{$bg[black]%}%{$fg_bold[cyan]%}%3~%{$reset_color%}!%{$fg_bold[grey]%}%h%(?.%{$fg[green]%}.%{$fg_no_bold[red]%}?%?%{$fg_bold[red]%})$%{$reset_color%} '
if (( $SHLVL > 2 )); then
  PROMPT='%{$fg[yellow]%}[$(($SHLVL-2))]'"$PROMPT"
fi
if [[ "$USER" = root ]]; then
  PROMPT='%{$fg_bold[red]%}root%{$fg_no_bold[green]%}@%{$fg[yellow]%}%m%{$fg_bold[magenta]%}:'"$PROMPT"
fi

# RPROMPT='%{$fg[red]%}%6~$(git_prompt_info)$(svn_prompt_info)%{$reset_color%}'
# RPROMPT='%{$fg[red]%}%6~%{$reset_color%}'
PS2='%{$fg[green]%}>%{$reset_color%}'

# alias showshlvl='PS1="%{$fg_no_bold[yellow]%}[$SHLVL]$PS1"'
# alias prompt_highlighted='PS1="%{$bg_bold[white]%}$PS1"'

# Customize to your needs...
# export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
# export PATH=~/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/.local/bin:/usr/bin/vendor_perl
export PATH=~/bin:/usr/bin:~/.my-venv/bin:~/.local/bin:/usr/bin/vendor_perl
alias pip=~/.my-venv/bin/pip
alias py=~/.my-venv/bin/python
READNULLCMD=less # pager for `<file`

#zstyle ':completion:*' hosts off

#autoload incremental-complete-word
#zle -N incremental-complete-word
#bindkey '^Xi' incremental-complete-word

autoload history-beginning-search-menu
zle -N history-search-space history-beginning-search-menu
bindkey '^[S' history-search-space

#function cmdcoloring {
  #ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

  # https://github.com/z-shell/F-Sy-H
  # fast-theme ~/projects/dotfiles/zsh-fast-syntax-highlighting.ini
  # remove hex-color: in functions/fast-highlight, if block with 0-9a-fA-F
  # compile:
  #  for f in {chroma,functions,share}/**(x^/) chroma/*.ch ; zrecompile -p -U -z $f.zwc $f || break
  fpath+=(~/game/zsh-fast-syntax-highlighting/)
  source ~/game/zsh-fast-syntax-highlighting/F-Sy-H.plugin.zsh
  FAST_HIGHLIGHT+=(chroma-/usr/bin/rg chroma/-grep.ch)
#}

# history-substring-search
# @{
# lazy loading
history-substring-search-up() {
  source ~/game/zsh-history-substring-search/zsh-history-substring-search.zsh
  history-substring-search-up
}
history-substring-search-down() {
  source ~/game/zsh-history-substring-search/zsh-history-substring-search.zsh
  history-substring-search-down
}

zle -N history-substring-search-up
zle -N history-substring-search-down

bindkey '^[K' history-substring-search-up
bindkey '^[J' history-substring-search-down
# @}

# autosuggestion
# @{
#ZSH_AUTOSUGGEST_MANUAL_REBIND=1
#ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
#source ~/game/zsh-autosuggestions/zsh-autosuggestions.zsh
#bindkey '^ ' autosuggest-accept # must be after bindkey '^@' ... ???
# @}

#[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
# export PATH="$PATH:$HOME/.fzf/bin"
#PATH+=':/$HOME/.fzf/bin'
#FZF_COMPLETION_TRIGGER=','
#source ~/.fzf/shell/completion.zsh

export FZF_DEFAULT_OPTS='--height 45% --cycle --reverse -m --ansi --tiebreak=index --no-sort --bind=ctrl-k:kill-line,alt-a:toggle-all,ctrl-a:select-all'

toggle-fzf-tab() { source ~/projects/fzf-tab/fzf-tab.zsh }
zle -N toggle-fzf-tab
bindkey "¿" toggle-fzf-tab

autoload jln-fzf-files jln-fzf-history-widget
zle -N jln-fzf-files
zle -N jln-fzf-history-widget
zle -N fzf-file-size jln-fzf-files
zle -N fzf-directories jln-fzf-files
zle -N fzf-file-norec jln-fzf-files
zstyle :fzf-directories glob-qualifiers '/'
zstyle :fzf-file-size glob-qualifiers '^/'
zstyle :fzf-file-size selector jln-fzf-size-selector
zstyle :fzf-file-size disable-recursive 1
zstyle :fzf-file-norec disable-recursive 1
bindkey ^\[\' jln-fzf-files
bindkey ^\[\\ fzf-file-norec
bindkey '^[;' fzf-directories
bindkey '^[r' jln-fzf-history-widget
bindkey '®' fzf-file-size

# alias afind='ack-grep -il'


## navigation

bindkey '^X^B' vi-find-prev-char
bindkey '^X^[' vi-match-bracket


## completion

setopt globstarshort
setopt nocaseglob
# setopt correct
setopt menu_complete    # autoselect the first completion entry
setopt noflowcontrol
setopt auto_menu        # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

bindkey '^[,' insert-last-word
bindkey '^[.' _history-complete-older

WORDCHARS=''

zmodload -i zsh/complist

# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completio
# zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[_[:lower:]]=** r:|[_[:upper:]]=** r:|=*'
# zstyle ':completion:*' matcher-list 'm:{[:lower:]_-}={[:upper:]-_}' 'r:|[.,_-]=* r:|[_[:lower:]]=** r:|[_[:upper:]]=** r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*:(argument-rest|files):*' matcher-list 'm:{[:lower:]_-}={[:upper:]-_} r:|[.,_-]=* r:|[_[:lower:]]=** r:|=* l:|=*'
# ':completion:*:*:*:*:(arguments|files)'
zstyle ':completion:*' matcher-list \
  'm:{[:lower:]_-}={[:upper:]-_}' \
  '+r:|[.,_-]=**' \
  'r:|{[:upper:]}=** l:{[:upper:]_-}|=**' \
  'm:{[:lower:]_-}={[:upper:]-_} r:|=* l:|=*' \
  'm:{[:lower:]_-}={[:upper:]-_} r:|{[:alpha:]_-}=** l:{[:alpha:]_-}|=**'

zstyle ':completion:*:*:*:*:*' menu select

zstyle ':completion:*' format $'\e''[37mCompleting '$'\e''[31m%d'$'\e''[0m'

# zstyle ':completion:*:options' list-colors '=^(#b)*(-- *)=35'
# zstyle ':completion:*:options' list-colors '=(#b)(*)-- (*)=36=0=34'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=31=0=34'
zstyle ':completion:*:*:killall:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=31=0=34'
# Same color as ls for completion
# eval "$(dircolors -b ~/.dircolors)" # load LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# complete manual by their section
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true

zstyle ':completion:*:*:*:*:processes' command "ps -u$USER -o pid,user,comm -w"

zstyle ':completion:*:er:*' file-patterns '*.(rar|zip|zst|gz|tar|lzma|bz2|tar.gz|tar.xz|tar.lz|tar.bz2|tar.zma|tbz|7z|Z|tbz2|tgz|tlz|txz|deb|cbr|cbz|jar) *(-/)'
#compdef "_files -g '(#i)*.(7z|Z|bz2|gz|lzma|rar|tar|tar.bz2|tar.gz|tar.xz|tar.zma|tbz|tbz2|tgz|tlz|txz|zip)(-.)'" extract

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)

# use /etc/hosts and known_hosts for hostname completion
# [[ -r /etc/ssh/ssh_known_hosts ]] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _global_ssh_hosts=()
# [[ -r ~/.ssh/known_hosts ]] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
# [[ -r ~/.ssh/config ]] && _ssh_config=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p')) || _ssh_config=()
# [[ -r /etc/hosts ]] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
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

# don't complete the same filenames again
zstyle ':completion:*:(rm|cp|mv|ls|er|p|pp|manga2pdf):*' ignore-line other

# only directory
zstyle ':completion:*:manga2pdf:*' file-patterns '*(-/)'

zstyle ':completion:*:git-checkout:*' sort false

zle -C complete-file complete-word _generic
zstyle ':completion:complete-file::::' completer _files
bindkey '^Xf' complete-file

autoload -U zg zs zhead weather er erd defl def br duration each zcalc zmv
alias zcp='zmv -C'
alias zln='zmv -L'
alias mmv='noglob zmv -W'
alias ccp='noglob zmv -WC'
alias lln='noglob zmv -WL'
alias aa='zcalc -r5'


# some more ls aliases
alias ll='ls -lh --time-style=long-iso'
alias la='ls -A'
alias l='ls -CF'
alias lr='ls -R'
alias llr='ls -ClRh'
alias lla='ls -ClAh'
alias l1='ls -1'
alias l.='ls -d -- .*'
alias l/='ls -d -- */'
alias lh='ls -sh'
alias lf='ls *(^/)'
alias lfh='ls -sh *(^/)'

function lll() {
  ls -l --color=always "$@" | less
  return $?
}

alias mv='mv -i'
alias cp='cp -i'
alias df='df -h'
alias du='du -h'
alias dus='du -sh'
alias duc='du -shc'
alias free='free -h'
alias cr='cp -R'
alias bat='bat --theme=Catppuccin-macchiato'
alias o=xdg-open

# alias c='cat'
c() { local f; for f; >&1 <$f }

alias j='jobs'

alias h='history'
hs() { zg -ac "$*" history }
hsi() { zg -ac "(#i)$*" history }

# alias g++-7=/usr/lib/gcc-snapshot/bin/g++

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=00;37:quote=00;32'

cxxflag='-Wall -Wextra -pedantic -Waligned-new -Walloca -Walloc-zero -Warray-bounds=2 -Wcast-align -Wcast-align=strict -Wcast-qual -Wclass-memaccess -Wconditionally-supported -Wconversion -Wdisabled-optimization -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wfloat-conversion -Wfloat-equal -Wformat=2 -Wformat-overflow=2 -Wformat-security -Wformat-signedness -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs -Wnon-virtual-dtor -Wno-shadow -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpacked -Wredundant-decls -Wstrict-null-sentinel -Wsuggest-attribute=noreturn -Wsuggest-override -Wtrampolines -Wundef -Wunused-macros -Wuseless-cast -Wvector-operation-performance -Wzero-as-null-pointer-constant'
alias gw++="g++ $cxxflag -fdiagnostics-color=always"
alias gw17="g++ $cxxflag -fdiagnostics-color=always -std=c++17"
alias gw20="g++ $cxxflag -fdiagnostics-color=always -std=c++20"
unset cxxflag

cxxflag='-Weverything -pedantic -Wconversion -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-covered-switch-default -Wno-exit-time-destructors -Wno-global-constructors -Wno-inconsistent-missing-destructor-override -Wno-mismatched-tags -Wno-padded -Wno-shadow -Wno-switch-default -Wno-switch-enum -Wno-undefined-var-template -Wno-weak-vtables'
export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer
alias cw++="clang++ $cxxflag -fcolor-diagnostics"
alias cw17="clang++ $cxxflag -fcolor-diagnostics -std=c++17"
alias cw20="clang++ $cxxflag -fcolor-diagnostics -std=c++20 -Wno-c++20-compat"
unset cxxflag

# coverage flags: -fprofile-arcs -ftest-coverage --coverage
# coverage optimization flags: -fprofile-use or -fprofile-use=path
# optimization flags: -O3 -funroll-loops -fpeel-loops -ffast-math -march=native -ffat-lto-objects -flto
# debug flags: -D_GLIBCXX_DEBUG_PEDANTIC -D_GLIBCXX_ASSERTIONS -D_GLIBCXX_DEBUG
# sanitizer flags: -fsanitize=address -fno-omit-frame-pointer-fsanitize=bounds-strict -fsanitize=undefined -fsanitize=bounds -fsanitize=leak

alias ux='chmod +x'
alias wl='wc -l'

# some more cd aliases
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias '.....'='cd ../../../..'
alias -- -='cd -1'
alias -- _='cd -1'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
# alias 6='cd -6'
# alias 7='cd -7'
# alias 8='cd -8'
# alias 9='cd -9'


alias md='mkdir -p'
alias rd=rmdir
alias d='>&1 <<<${(F)${(Af)"$(dirs -v)"}[1,10]}'
m() {
  (( $# < 1 )) && echo "Usage: $0 missing directory" >&2 && return 1
  mkdir -p -- "$@" && cd -- "$1"
}

alias tmp='cd ~/rawdisk2'

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# some more grep aliases
alias f='zg -a'
alias fx='zg -xa'

# altermative grep: ripgrep
# alias ripgrep=/usr/bin/rg
alias rg='/usr/bin/rg --no-ignore-vcs --no-ignore-global --no-heading --hidden --glob='\''!{.git}'\'
alias gn='rg --no-filename'
alias gf='rg --files-with-matches'
alias g1='rg -m1'
alias gf1='gf -m1'

# some more git aliases
alias gsh='git stash'
alias gst='git status'
alias gpo='git push origin'
alias glo='git pull origin'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gc!='git commit --amend'
alias gca!='git commit --amend -a'
gcm() { git commit -v -m "$*" ; }
gcmm() { git commit --amend -m "$*" ; }
gcam() { git commit -v -a -m "$*" ; }
gcamm() { git commit --amend -a -m "$*" ; }
alias gcm='noglob gcm'
alias gcm!='noglob gcmm'
alias gcam='noglob gcam'
alias gcam!='noglob gcamm'
alias goops='git commit -v --amend --no-edit'
alias gco='git restore'
alias gso='git switch'
alias gb='git branch'
alias gba='git branch -a'
alias gs='git status -s'
alias gss='git status'
alias gri='git rebase -i'
alias grc='git rebase --continue'

# git diff
alias gd='git diff'
alias gda='git diff --staged'
alias gdl='DELTA_FEATURES=long-line git diff'
alias gdn='DELTA_FEATURES=line-numbers git diff'
alias gdd='DELTA_FEATURES=side-by-side git diff'
alias gdc='git diff --word-diff-regex=.'
alias gdw='git diff --word-diff-regex=\\w+'
alias gdww='git diff --word-diff'
alias lgdc='GIT_PAGER=less git diff --word-diff-regex=.'
alias lgdw='GIT_PAGER=less git diff --word-diff-regex=\\w+'
alias lgdww='GIT_PAGER=less git diff --word-diff'
alias gd0='DELTA_FEATURES=unified0 gd --unified=0'
alias gdc0='DELTA_FEATURES=unified0 gdc --unified=0'
alias gdw0='DELTA_FEATURES=unified0 gdw --unified=0'
alias gdww0='DELTA_FEATURES=unified0 gdww --unified=0'
alias cgd='DELTA_PAGER= gd'
alias cgdl='DELTA_PAGER= DELTA_FEATURES=long-line gd'
alias lcgd='GIT_PAGER= gd'
alias cgdc='DELTA_PAGER= gdc'
alias cgdw='DELTA_PAGER= gdw'
alias cgdww='DELTA_PAGER= gdww'
alias cgd0='DELTA_PAGER= gd0'
alias cgdc0='DELTA_PAGER= gdc0'
alias cgdw0='DELTA_PAGER= gdw0'
alias cgdww0='DELTA_PAGER= gdww0'
alias gds='GIT_PAGER= git diff --stat'
alias gdsr='GIT_PAGER= git diff --stat --relative'

alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'

# git log
alias glp='git log -p --'
alias glgg='git log --stat --pretty=tformat:"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ar)%Creset" -n4'
alias cglg='GIT_PAGER= glgg'
alias glg='GIT_PAGER= git log --graph --pretty=tformat:"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ar)%Creset" -n10'
#alias glog='GIT_PAGER= git log --oneline --decorate --color --graph -n10'

alias git_current_branch='git symbolic-ref --short HEAD'

alias gl='git pull origin $(git_current_branch)'
alias gp='git push origin $(git_current_branch)'
# alias glp='git pull origin $(git_current_branch) && git push origin $(git_current_branch)'

alias glr='gl --rebase'


# some more diff aliases
alias diff='/usr/bin/diff -U3 --color'
alias yd='/usr/bin/diff --color -y -W $COLUMNS'
alias ydc=icdiff
nd() {
  /usr/bin/diff \
  --unchanged-line-format='%-4dn %L' \
  --new-line-format="%-4dn%c'\033'[32m+%l%c'\033'[0m%c'\12'" \
  --old-line-format="%-4dn%c'\033'[31m-%l%c'\033'[0m%c'\12'" \
  "$@"
}
ud() {
  /usr/bin/diff \
  --unchanged-line-format= \
  --new-line-format="%4dn %c'\033'[32m> %l%c'\033'[0m%c'\12'" \
  --old-line-format="%4dn %c'\033'[31m< %l%c'\033'[0m%c'\12'" \
  --old-group-format="%c'\033'[34mc%dn%c'\033'[0m%c'\12'%<" \
  --new-group-format="%c'\033'[34mc%dN%c'\033'[0m%c'\12'%>" \
  "$@"
}
alias wd='dwdiff -w$'\''\e[31m[-'\'' -x$'\''-]\e[0m'\'' -y$'\''\e[32m{+'\'' -z$'\''+}\e[0m'\'
alias wdw='wd -C0'
alias ldelta='DELTA_FEATURES=long-line delta'

export DELTA_PAGER=less-if-not-empty

a() { echo $(($*)) }

#alias brightness='xrandr --output LVDS-0 --brightness'

#function jhibernate(){
#  sudo pm-hibernate
#  #sleep 2
#  #qdbus org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness 33 >/dev/null
#  xmodmap ~/.Xmodmap
#}
#alias jhibernate='sudo pm-hibernate'

function man(){
  # man 5 termcap
  # mb  Start blinking
  # md  Start bold mode
  # me  End all mode like so, us, mb, md and mr
  # so  Start standout mode
  # se  End standout mode
  # us  Start underlining
  # ue  End underlining
  if [[ $1 = 3 ]]; then
    local paging=
    if [[ -n $PAGER ]]; then
      local paging="--color=always | $PAGER"
    fi
    GROFF_NO_SGR=1 command man -P"sh -c 'col -bx | bat -l man -p --theme=Catppuccin-macchiato $paging'" "$@"
  else
    LESS_TERMCAP_md=$'\e[31m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[32m' \
    LESS_TERMCAP_so=$'\e[47;30m' \
    GROFF_NO_SGR=1 \
    command man "$@"
  fi
}

# alias qdbus=/usr/lib/x86_64-linux-gnu/qt4/bin/qdbus

mem() { ps h -C"$*" -o fname,rss }
psg() { zg -ac "$*" ps aux }

swap() {
  1=$1:a
  2=$2:a
  mv $1 $1.swap-$$.tmp &&
  mv $2 $1 &&
  mv $1.swap-$$.tmp $2
}

bak() { cp "$1" "$1"_${(%):-%D{%H:%M:%S_%d-%m-%Y}} }

k() { awk "{ print $@ }" ; }

alias hi='ksyntaxhighlighter6 -tJln\ Dark -b -fansi256Colors'
alias ihi='hi -s'
hin() { hi "$@" | cat -n ; }
ihin() { ihi "$@" | cat -n ; }

za() { zoxide add $@ }

z() {
  local __zoxide_result
  __zoxide_result=$(zoxide query -- $@) && cd $__zoxide_result
}

zi() {
  local __zoxide_result
  __zoxide_result=$(zoxide query -i -- $@) && cd $__zoxide_result
}


alias n=nano
alias i='imv -f'
alias ii='imv -fs none'
alias x=xpdf
alias t=tree
alias td='tree -d'
alias ta='tree -a'
alias tp='tree -p'
alias ts='tree -sh'
alias v=vim
alias s=sed
alias mpv='mpv --no-resume-playback'

p() { mpv --no-resume-playback -af scaletempo --really-quiet -fs --speed=1.61 "$@" ; } # auto-complete only for files
pp() {
  local audio f
  for f; {
    audio=($f:r:r.f*)
    p $f --audio-file=$audio
  }
}
zstyle ':completion:*:pp:*' file-patterns '*.mp4'

alias mmcal="gcal -H '\e[01;33m:\e[0m:\e[31m:\e[0m' -s1 -q FR -N"
alias mcal="mmcal .+"

alias bjam='bjam --build-dir='$HOME'/projects/build'

vg() { valgrind --suppressions=$HOME/projects/dotfiles/usr/lib/valgrind/dl_init.supp "$@" 2> >(colout -t valgrind) ; }
alias vgl='vg --leak-check=full --show-leak-kinds=all'

alias gdbrun='gdb -q -ex run --args'
alias bt="gdb -q --batch --return-child-result -x ~/.gdbbt -ex run --args"
alias bte="gdb -q --batch --return-child-result -x ~/.gdbbt -ex 'catch throw' -ex run --args"

y() yt-dlp --no-part --no-mtime --no-playlist -f 'bv*[height<=1080]+ba/b' $@
yl() yt-dlp --no-part --no-mtime --no-playlist -f 'bv*[height<=720]+ba/b' $@
yh() yt-dlp --no-part --no-mtime --no-playlist $@
yy() yt-dlp --no-part --no-mtime --yes-playlist -f 'bv*[height<=1080]+ba/b' $@
yyl() yt-dlp --no-part --no-mtime --yes-playlist -f 'bv*[height<=720]+ba/b' $@
yyh() yt-dlp --no-part --no-mtime --yes-playlist $@

alias y='noglob y'
alias yl='noglob yl'
alias yh='noglob yh'
alias yy='noglob yy'
alias yyl='noglob yyl'
alias yyh='noglob yyh'

alias na='cat -n'
alias ne='cat -e'

## paru / pacman

# https://wiki.archlinux.fr/Pacman
# https://wiki.archlinux.org/index.php/Pacman/Rosetta

alias acs='paru -Ss' # search

alias ag='paru -Su' # upgrade
alias ad='paru -Sy' # update / refresh info
alias adg='paru' # update and upgrade
alias adga='paru -Syua' # update and upgrade AUR

alias ai='paru' # install
alias ain='paru -S' # install exactly
alias ar='paru -R' # removes
#alias ap='paru -Rs' # + dependancies
alias ap='paru -Rsn' # + config
apurge() { sudo paru -Rns $(paru -Qtdq) }
# alias di='paru -U' # installs local package file

alias aci='paru -Qi' # info
alias acii='paru -Si'

alias afl='paru -Ql'
alias afll='pkgfile -l' # list file
alias afss='paru -Qo' # search file
# alias afs='pkgfile -sr' # search with regex
alias afs='pacman -Ql |rg'

# /var/cache/pacman/pkg/
# alias aac='paru -Sc' # empty the cache
alias aac='paccache -r' # ... except the last three latest versions
alias aacc='paccache -ruk0' # + uninstalled

#alias 'paru -Qc' # changelog

# alias deborphan='paru -Qm' # List packages that are installed but are not available in any installation source (anymore).
# alias 'deborphan -anp1'='paru -Qt' # List packages not required by any other package

# if pacman fails
# Mount fs
# pacman -r /path/to/rootfs -Syyu
# pacman -r /path/to/rootfs -S paquet


## correction

# alias man='nocorrect man'
# alias mv='nocorrect mv'
# alias mysql='nocorrect mysql'
# alias mkdir='nocorrect mkdir'
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

## aliases

autoload jln-glob
alias nx='jln-glob numeric ; jln-glob-pop'
alias ex='jln-glob extendedglob ; jln-glob-pop'
alias ix='jln-glob nocase numeric ; jln-glob-pop'

alias a='noglob a'
alias wg='noglob wget'

## global aliases

alias -g \
  C='--color=always' \
  ZF='|fo' \
  @@='|col /dev/stdin' \
  NN='*(oc[1])' NNF='*(oc[1].)' NND='*(oc[1]/)' \
\
  N='>/dev/null'   T='>~/rawdisk2/l'   TT='>~/rawdisk2/ll' \
  N2='2>/dev/null' T2='2>~/rawdisk2/l' TT2='2>~/rawdisk2/ll' \
\
  F='|zg -a'    K='|k'    L='|less'    O='|sort'    R='|rg'    S='|sed' \
  F2='|&zg -a'  K2='|&k'  L2='|&less'  O2='|&sort'  R2='|&rg'  S2='|&sed' \
  U='|sort -u'    W='|while read'    X='|xargs -d\\n'    Z='|fzf' \
  U2='|&sort -u'  W2='|&while read'  X2='|&xargs -d\\n'  Z2='|&fzf'

col() { for l in ${(f)"$(<$1)"} ; >&1 <<<${${(Az)l}[$2]} }
colx() { for l in ${(f)"$(eval ${(q)@[2,$]})"} ; >&1 <<<${${(Az)l}[$1]} }

## functions

#function zsh_stats() {
#  column -c3 -s " " -t <<<${(F)${(On)"${(f)$(fc -ln 0 | awk '{CMD[$1]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}')}"}[1,20]}
#}

fo() { eval $@:q ${(uq)${${(f)"$(fzf -n3..,1 -d:)"}/:*/}} }
gfo() { rg -nH --color=always "$@[2,$]" |fo $1 }

ler() { ~/game/waiting_for_reading $1 unrar x $1 }
zstyle ':completion:*:ler:*' file-patterns '*(rar|RAR) *(-/)'

## history

## Command history configuration
# if [[ -z $HISTFILE ]]; then
    HISTFILE=$HOME/.zhistory
# fi
HISTSIZE=1000
SAVEHIST=5000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_fcntl_lock
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history


## key-bindings

# menuselect navigation
bindkey -M menuselect -s 'á' '^[[A^[[A^[[A^[[A^[[A' # AltGr+A  top *5
bindkey -M menuselect -s 'ð' '^[[B^[[B^[[B^[[B^[[B' # AltGr+D  bottom *5
bindkey -M menuselect    'å' up-line-or-history     # AltGr+W  top
bindkey -M menuselect    'ß' down-line-or-history   # AltGr+S  bottom
bindkey -M menuselect    'ä' backward-char          # AltGr+Z  left
bindkey -M menuselect    'é' forward-char           # AltGr+C  right

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

bindkey '^[-' redo # replace neg-argument

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
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[1;5A' up-line-or-beginning-search
bindkey '^[[1;5B' down-line-or-beginning-search
#bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
#bindkey "$terminfo[kcud1]" down-line-or-beginning-search

# Cycle through globs choices, one at a time.
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
  LBUFFER+='*(/)'
  zle _cycle-glob
}

_list-file()
{
  LBUFFER+='*(^/)'
  zle _cycle-glob
}

_previous-dir()
{
  cd $OLDPWD
  zle reset-prompt
}

#_rationalise-dot() {
#  if [[ $LBUFFER = *.. ]] {
#    LBUFFER+=/..
#  } else {
#    LBUFFER+=.
#  }
#}

zle -N _popd
zle -N _pushd
zle -N _list-dir
zle -N _list-file
zle -N _previous-dir
#zle -N _rationalise-dot
bindkey 'ß' _popd
bindkey 'å' _pushd
bindkey 'ð' _list-dir
bindkey 'á' _list-file
bindkey 'ä' _previous-dir
#bindkey "." _rationalise-dot


# see split-shell-arguments and replace-argument

autoload -U jln-backward-arg jln-backward-arg-end jln-forward-arg jln-forward-arg-end jln-kill-arg jln-kill-arg-and-space jln-transpose-arg
zle -N jln-backward-arg
zle -N jln-backward-arg-end
zle -N jln-forward-arg
zle -N jln-forward-arg-end
zle -N jln-kill-arg
zle -N jln-kill-arg-and-space
zle -N jln-transpose-arg
bindkey '^[^B' jln-backward-arg
bindkey '^[^N' jln-backward-arg-end
bindkey '^[^F' jln-forward-arg
bindkey '^[^G' jln-forward-arg-end
bindkey '^[^K' jln-kill-arg
bindkey '^[^J' jln-kill-arg-and-space
bindkey '^[^T' jln-transpose-arg

#_inc_last_arg() {
#  local r=${BUFFER/* }
#  [[ '}' = "${r[${#r}]}" ]] && r=${r/\{*}${${r/*..}:0:-1}
#  local n=$((${r//[^0-9]/}+1))
#  [[ -n $NUMERIC ]] && n="{$n..$NUMERIC}"
#  BUFFER=${BUFFER% *}' '$n
#  CURSOR=$#BUFFER
#}
#zle -N _inc_last_arg
#bindkey "^[=" _inc_last_arg
# autoload -U incarg
# zle -N incarg

function kill-prev-char-region()
{
  zle set-mark-command
  zle vi-find-prev-char
  zle kill-region
}

function kill-next-char-region()
{
  zle set-mark-command
  zle vi-find-next-char
  zle kill-region
}

zle -N kill-prev-char-region
zle -N kill-next-char-region
bindkey '^X^K' kill-prev-char-region
bindkey '^X^D' kill-next-char-region

autoload -U jln-save-command-line
zle -N jln-save-command-line
bindkey '^[^@' jln-save-command-line

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

autoload -U jln-pick
zle -N jln-pick-column jln-pick
zle -N jln-pick
zstyle :jln-pick-column mode column
bindkey '^[&' jln-pick
bindkey '^[|' jln-pick-column

## misc

## smart urls
# autoload -U url-quote-magic
# zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
# setopt long_list_jobs

# export LC_CTYPE=$LANG


## theme-and-apparence

autoload colors; colors;

# if [[ x$WINDOW != x ]]
# then
#     SCREEN_NO="%B$WINDOW%b "
# else
#     SCREEN_NO=""
# fi

autoload -U smart-sudo
alias sudo=smart-sudo
compdef _sudo smart-sudo

autoload -U jln-insert-sudo jln-insert-space-and-accept jln-insert-command
zle -N jln-insert-sudo
zle -N jln-insert-space-and-accept
zle -N jln-insert-command
bindkey '\e\e' jln-insert-sudo
bindkey '^[j' jln-insert-space-and-accept
bindkey '^[#' jln-insert-command

_insert_cb() { LBUFFER+=${(q)$(xclip -out)} }
zle -N _insert_cb
bindkey '^[V' _insert_cb # previously quoted-insert

alias clipcopy='xclip -selection clipboard'

copybuffer () { clipcopy <<<$BUFFER }
zle -N copybuffer
#bindkey "^[o" copybuffer

# uses a function to make command autocompletion work (_precommand)
tt() /usr/bin/time --format='%Es - %MK' "$@"
alias kk=kdevelop

# set auto-completion
_comps[tt]=_precommand
_comps[each]=_precommand
_comps[duration]=_precommand
_comps[jln-glob-pop]=_precommand

rand() REPLY=$RANDOM

# [[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
