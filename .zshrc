setopt prompt_subst nobeep

export EDITOR=nano
export LESS=-iRj3
export TMPDIR=/home/jonathan/rawdisk
export RLWRAP_HOME=/home/jonathan/.rlwrap

[ $TERM = rxvt-unicode ] && TERM=xterm-256color

#if [ -x /usr/bin/dircolors ]; then
  # test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  export LS_COLORS='bd=38;5;68:ca=38;5;17:cd=38;5;113;1:di=38;5;68;4:do=38;5;127:ex=38;5;166;1:pi=38;5;126:fi=38;5;252:ln=target:mh=38;'\
'5;220;1:or=48;5;160;38;5;232;1:ow=38;5;220;1:sg=48;5;234;38;5;100;1:su=38;5;137:so=38;5;197:st=38;5;86;48;5;234:tw=48;5;235;'\
'38;5;139;3:*LS_COLORS=48;5;89;38;5;197;1;3;4;7:*.BAT=38;5;108:*.PL=38;5;167:*.ahk=38;5;29;1:*.asc=38;5;192;3:*.asm=38;5;240;'\
'1:*.awk=38;5;148;1:*.bash=38;5;173:*.bat=38;5;108:*.c=38;5;110:*.cc=38;5;178:*.ii=38;5;178:*.cfg=1:*.conf=1:*.rc=1:*.cl=38;'\
'5;204;1:*.coffee=38;5;94;1:*.C=38;5;178:*.cp=38;5;178:*.cpp=38;5;178:*.cxx=38;5;178:*.c++=38;5;178:*.ii=38;5;178:*.cs=38;5;'\
'74;1:*.css=38;5;135:*.csv=38;5;78:*.ctp=38;5;95:*.diff=48;5;197;38;5;232:*.enc=38;5;192;3:*.eps=38;5;192:*.etx=38;5;172:*.ex=38;'\
'5;148;1:*.example=38;5;225;1:*.git=38;5;197:*.gitignore=38;5;240:*.gitattributes=38;5;240:*.go=38;5;36;1:*.h=38;5;81:*.H=38;'\
'5;81:*.hpp=38;5;81:*.hxx=38;5;81:*.h++=38;5;81:*.tcc=38;5;81:*.f=38;5;81:*.for=38;5;81:*.ftn=38;5;81:*.s=38;5;81:*.S=38;5;'\
'81:*.sx=38;5;81:*.gpg=38;5;192;3:*.hi=38;5;240:*.hs=38;5;155;1:*.htm=38;5;125;1:*.html=38;5;125;1:*.info=38;5;101:*.ini=38;'\
'5;122:*.java=38;5;142;1:*.jhtm=38;5;125;1:*.js=38;5;42:*.jsm=38;5;42:*.jsm=38;5;42:*.json=38;5;199:*.jsp=38;5;45:*.lisp=38;'\
'5;204;1:*.log=38;5;190:*.lua=38;5;34;1:*.m=38;5;130;3:*.mht=38;5;129:*.mm=38;5;130;3:*.M=38;5;130;3:*.map=38;5;58;3:*.markdown=38;'\
'5;184:*.md=38;5;184:*.mf=38;5;220;3:*.mfasl=38;5;73:*.mi=38;5;15:*.mkd=38;5;184:*.mtx=38;5;36;3:*.nfo=38;5;220:*.o=38;5;240:*.pacnew=38;'\
'5;33:*.patch=48;5;197;38;5;232;1:*.pc=38;5;100:*.pfa=38;5;43:*.pgp=38;5;192;3:*.pgsql=38;5;222:*.php=38;5;170:*.pl=38;5;214:*.plt=38;'\
'5;204;1:*.pm=38;5;197;1:*.pod=38;5;172;1:*.py=38;5;41:*.pyc=38;5;240:*.rb=38;5;192:*.rdf=38;5;144:*.rst=38;5;67:*.ru=38;5;'\
'142:*.scm=38;5;204;1:*.sed=38;5;130;1:*.sfv=38;5;197:*.sh=38;5;113:*.sig=38;5;192;3:*.signature=38;5;206:*.sql=38;5;222:*.srt=38;'\
'5;116:*.sty=38;5;58:*.sug=38;5;44:*.t=38;5;28;1:*.tcl=38;5;64;1:*.tdy=38;5;214:*.tex=38;5;172:*.textile=38;5;106:*.tfm=38;'\
'5;64:*.tfnt=38;5;140:*.theme=38;5;109:*.txt=38;5;186:*.urlview=38;5;85:*.vim=1:*.viminfo=38;5;240;1:*.xml=38;5;199:*.yml=38;'\
'5;208:*.zsh=38;5;173:*README=38;5;220;1:*Makefile=38;5;160:*MANIFEST=38;5;243:*pm_to_blib=38;5;240:*.1=38;5;160;1:*.3=38;5;'\
'160;1:*.7=38;5;160;1:*.1p=38;5;167:*.3p=38;5;167:*.am=38;5;242:*.in=38;5;242:*.old=38;5;242:*.out=38;5;46;1:*.bmp=38;5;62:*.cdr=38;'\
'5;59:*.gif=38;5;72:*.ico=38;5;73:*.jpeg=38;5;66:*.jpg=38;5;66:*.JPG=38;5;66:*.png=38;5;30:*.svg=38;5;132:*.xpm=38;5;36:*.32x=38;'\
'5;137:*.A64=38;5;82:*.a00=38;5;11:*.a52=38;5;112:*.a64=38;5;82:*.a78=38;5;112:*.adf=38;5;35:*.atr=38;5;213:*.cdi=38;5;15:*.fm2=38;'\
'5;35:*.gb=38;5;203:*.gba=38;5;205:*.gbc=38;5;204:*.gel=38;5;83:*.gg=38;5;138:*.ggl=38;5;83:*.j64=38;5;102:*.nds=38;5;193:*.nes=38;'\
'5;167:*.rom=38;5;59;1:*.sav=38;5;220:*.sms=38;5;33:*.st=38;5;208;1:*.iso=38;5;15:*.nrg=38;5;15:*.qcow=38;5;141:*.VOB=38;5;'\
'137:*.IFO=38;5;240:*.BUP=38;5;241:*.MOV=38;5;42:*.3gp=38;5;134:*.3g2=38;5;133:*.asf=38;5;25:*.avi=38;5;114:*.divx=38;5;112:*.f4v=38;'\
'5;125:*.flv=38;5;131:*.m2v=38;5;166:*.mkv=38;5;202:*.mov=38;5;42:*.mp4=38;5;15:*.mpg=38;5;38:*.mpeg=38;5;38:*.ogm=38;5;97:*.ogv=38;'\
'5;94:*.rmvb=38;5;112:*.sample=38;5;130;1:*.ts=38;5;39:*.vob=38;5;137:*.webm=38;5;109:*.wmv=38;5;113:*.3ga=38;5;95:*.S3M=38;'\
'5;71;1:*.aac=38;5;137:*.ape=38;5;166;1:*.cue=38;5;112:*.dat=38;5;165:*.dts=38;5;100;1:*.fcm=38;5;41:*.flac=38;5;166;1:*.m3u=38;'\
'5;172:*.m3u8=38;5;172:*.m4=38;5;160;3:*.m4a=38;5;137;1:*.mid=38;5;102:*.midi=38;5;102:*.mod=38;5;72:*.mp3=38;5;185:*.oga=38;'\
'5;95:*.ogg=38;5;96:*.s3m=38;5;71;1:*.sid=38;5;69;1:*.spl=38;5;173:*.wv=38;5;149:*.wvc=38;5;149:*.wma=38;5;150:*.afm=38;5;58:*.pfb=38;'\
'5;58:*.pfm=38;5;58:*.ttf=38;5;66:*.pcf=38;5;65:*.psf=38;5;64:*.bak=38;5;41;1:*.bin=38;5;249:*.pid=38;5;167:*.state=38;5;15:*.swo=38;'\
'5;236:*.swp=38;5;241:*.tmp=38;5;244:*.un~=38;5;240:*.zcompdump=38;5;240:*.zwc=38;5;240:*.db=48;5;233;38;5;60;1;3:*.dump=38;'\
'5;118:*.sqlite=48;5;233;38;5;60;1:*.typelib=48;5;233;38;5;60;1;3:*.localstorage=48;5;233;38;5;60;1;3:*.7z=38;5;40:*.a=38;5;'\
'46:*.apk=38;5;172;3:*.arj=38;5;41:*.bsp=38;5;239;1:*.bz2=38;5;44:*.cab=38;5;215:*.deb=38;5;215:*.gz=38;5;34:*.ipk=38;5;117:*.jad=38;'\
'5;50:*.jar=38;5;51:*.nth=38;5;40:*.sis=38;5;39:*.part=38;5;239;1:*.r00=38;5;239:*.r01=38;5;239:*.r02=38;5;239:*.r03=38;5;239:*.r04=38;'\
'5;239:*.r05=38;5;239:*.r06=38;5;239:*.r07=38;5;239:*.r08=38;5;239:*.r09=38;5;239:*.r10=38;5;239:*.r100=38;5;239:*.r101=38;'\
'5;239:*.r102=38;5;239:*.r103=38;5;239:*.r104=38;5;239:*.r105=38;5;239:*.r106=38;5;239:*.r107=38;5;239:*.r108=38;5;239:*.r109=38;'\
'5;239:*.r11=38;5;239:*.r110=38;5;239:*.r111=38;5;239:*.r112=38;5;239:*.r113=38;5;239:*.r114=38;5;239:*.r115=38;5;239:*.r116=38;'\
'5;239:*.r12=38;5;239:*.r13=38;5;239:*.r14=38;5;239:*.r15=38;5;239:*.r16=38;5;239:*.r17=38;5;239:*.r18=38;5;239:*.r19=38;5;'\
'239:*.r20=38;5;239:*.r21=38;5;239:*.r22=38;5;239:*.r25=38;5;239:*.r26=38;5;239:*.r27=38;5;239:*.r28=38;5;239:*.r29=38;5;239:*.r30=38;'\
'5;239:*.r31=38;5;239:*.r32=38;5;239:*.r33=38;5;239:*.r34=38;5;239:*.r35=38;5;239:*.r36=38;5;239:*.r37=38;5;239:*.r38=38;5;'\
'239:*.r39=38;5;239:*.r40=38;5;239:*.r41=38;5;239:*.r42=38;5;239:*.r43=38;5;239:*.r44=38;5;239:*.r45=38;5;239:*.r46=38;5;239:*.r47=38;'\
'5;239:*.r48=38;5;239:*.r49=38;5;239:*.r50=38;5;239:*.r51=38;5;239:*.r52=38;5;239:*.r53=38;5;239:*.r54=38;5;239:*.r55=38;5;'\
'239:*.r56=38;5;239:*.r57=38;5;239:*.r58=38;5;239:*.r59=38;5;239:*.r60=38;5;239:*.r61=38;5;239:*.r62=38;5;239:*.r63=38;5;239:*.r64=38;'\
'5;239:*.r65=38;5;239:*.r66=38;5;239:*.r67=38;5;239:*.r68=38;5;239:*.r69=38;5;239:*.r69=38;5;239:*.r70=38;5;239:*.r71=38;5;'\
'239:*.r72=38;5;239:*.r73=38;5;239:*.r74=38;5;239:*.r75=38;5;239:*.r76=38;5;239:*.r77=38;5;239:*.r78=38;5;239:*.r79=38;5;239:*.r80=38;'\
'5;239:*.r81=38;5;239:*.r82=38;5;239:*.r83=38;5;239:*.r84=38;5;239:*.r85=38;5;239:*.r86=38;5;239:*.r87=38;5;239:*.r88=38;5;'\
'239:*.r89=38;5;239:*.r90=38;5;239:*.r91=38;5;239:*.r92=38;5;239:*.r93=38;5;239:*.r94=38;5;239:*.r95=38;5;239:*.r96=38;5;239:*.r97=38;'\
'5;239:*.r98=38;5;239:*.r99=38;5;239:*.rar=38;5;106;1:*.tar=38;5;119:*.tgz=38;5;35;1:*.vpk=38;5;239;1:*.vdf=38;5;215:*.xz=38;'\
'5;118:*.zip=38;5;41:*.pdf=38;5;203:*.djvu=38;5;141:*.cbr=38;5;140:*.cbz=38;5;140:*.chm=38;5;145:*.epub=38;5;144:*.odt=38;5;'\
'111:*.ods=38;5;112:*.odp=38;5;166:*.odb=38;5;161:*.accdb=38;5;60;1:*.accde=38;5;60;1:*.accdt=38;5;60;1:*.accdr=38;5;60;1:*.docx=38;'\
'5;111:*.docm=38;5;111;4:*.xla=38;5;76:*.xlsx=38;5;112:*.xlsxm=38;5;112;4:*.xltx=38;5;73:*.xltm=38;5;73;4:*.ppt=38;5;166:*.pot=38;'\
'5;166:*.pps=38;5;166:*.allow=38;5;112:*.deny=38;5;160:*.SKIP=38;5;244:*.def=38;5;31:*.directory=38;5;83:*.err=38;5;167;1:*.error=38;'\
'5;167;1:*.pi=38;5;126:*.properties=38;5;197;1:*.torrent=38;5;58:*.gp3=38;5;114:*.gp4=38;5;115:*.tg=38;5;99:*.gbr=38;5;2:*.ger=38;'\
'5;2:*.pcb=38;5;28:*.sch=38;5;34:*.cnc=38;5;37:*.xln=38;5;37:*.pcap=38;5;29:*.cap=38;5;29:*.dmp=38;5;29:*.service=38;5;81:*@.service=38;'\
'5;45:*.socket=38;5;75:*.device=38;5;24:*.mount=38;5;115:*.automount=38;5;114:*.swap=38;5;113:*.target=38;5;73:*.path=38;5;'\
'116:*.timer=38;5;111:*.snapshot=38;5;139:*.ninja=38;5;160:*.build=38;5;186'
  alias ls='ls --color=auto'
  alias grep='grep --color=auto --exclude-dir=.git'
  GREP_COLOR='1;31'
#fi


# Save the location of the current completion dump file.
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
fpath+=(~/projects/dotfiles/zsh_functions.zwc ~/.zshcompletions.zwc)

# Load and run compinit
autoload -U compinit
compinit -i -d "${ZSH_COMPDUMP}"

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
export PATH=~/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:~/.local/bin:/usr/bin/vendor_perl
READNULLCMD=less # pager for `<file`

#zstyle ':completion:*' hosts off

#autoload incremental-complete-word
#zle -N incremental-complete-word
#bindkey '^Xi' incremental-complete-word

#function cmdcoloring {
  #ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

  # fast-theme ~/projects/dotfiles/.fzs/jln.ini
  # FAST_THEME_NAME=jln
  source ~/game/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
#}

#loadplugins() {
  source ~/game/zsh-history-substring-search/zsh-history-substring-search.zsh

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

autoload _fzf_file_or_directory
fzf-file-widget () { _fzf_file_or_directory '-o -type f -print -o -type l -print' ; }
fzf-directory-widget () { _fzf_file_or_directory '' ; }
zle     -N    fzf-file-widget
bindkey ^\[\' fzf-file-widget
zle     -N    fzf-directory-widget
bindkey '^[;' fzf-directory-widget

autoload fzf-history-widget
zle     -N   fzf-history-widget
bindkey '^[r' fzf-history-widget

alias history='fc -l 1'

# alias afind='ack-grep -il'


## navigation

bindkey '^X^B' vi-find-prev-char
bindkey '^X^[' vi-match-bracket


## completion

setopt menu_complete   # autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on succesive tab press
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


autoload -U zg zs

# some more ls aliases
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias lr='ls -R'
alias llr='ls -ClRh'
alias lla='ls -ClAh'
alias l1='ls -1'
alias l.='ls -d -- .*'
alias l/='ls -d -- */'
alias lh='ls -sh'
# alias sl=ls # often screw this u

function lll() {
  ls -l --color=always "$@" | less
  return $?
}

alias mv='mv -i'
alias cp='cp -i'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias cr='cp -R'

# alias c='cat'
c() { echo -E "$(<$1)" }

alias j='jobs'

alias h='history'
hs() { zg -ac "$*" history }
hsi() { zg -ac "(#i)$*" history }

# alias g++-7=/usr/lib/gcc-snapshot/bin/g++

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=00;37:quote=00;32'

# -Wstrict-overflow=1 # -Wall
# -Wstrict-overflow=2
# -Wstrict-overflow=3
# -Wstrict-overflow=4
# -Wstrict-overflow=5
# -Wstrict-default # bad idea
# -Wmissing-format-attribute
cxxflag='-Wall -Wextra -pedantic -Wcast-align -Wcast-qual -Wdisabled-optimization -Wfloat-equal -Wformat-security -Wformat-signedness -Wformat=2 -Wmissing-declarations -Wmissing-include-dirs -Wnon-virtual-dtor -Wold-style-cast -Woverloaded-virtual -Wpacked -Wredundant-decls -Wundef -Wuninitialized -Wunused-macros -Wvla -Wswitch -Wconversion -Wduplicated-cond -Wnull-dereference -fsized-deallocation -Warray-bounds=2 -Wconditionally-supported -Wnoexcept -Wsized-deallocation -Wstrict-null-sentinel -Wsuggest-override -Wfloat-conversion -Wopenmp-simd -Wuseless-cast -Wsuggest-attribute=noreturn -Wzero-as-null-pointer-constant -Wlogical-op -Wvector-operation-performance -Wdouble-promotion -Wtrampolines -Winline -Wshadow=local -Wclass-memaccess -Wduplicated-branches'
alias gw++="g++ $cxxflag"
alias gw14="g++ -fdiagnostics-color=always -std=c++14 $cxxflag"
alias gw17="g++ -fdiagnostics-color=always -std=c++17 $cxxflag"
unset cxxflag

cxxflag='-Weverything -Wno-shadow -Wno-effc++ -Wno-padded -Wno-c++98-compat -Wno-exit-time-destructors -Wno-global-constructors -Wno-gnu-zero-variadic-macro-arguments -Wno-disabled-macro-expansion -Wno-documentation-unknown-command -Wno-documentation -Wno-missing-prototypes -Wno-c++98-compat-pedantic'
export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer
alias cw++="clang++ $cxxflag -fcolor-diagnostics"
alias cw14="clang++ $cxxflag -fcolor-diagnostics -std=c++14"
alias cw17="clang++ $cxxflag -fcolor-diagnostics -std=c++17"
unset cxxflag

# coverage flags: -fprofile-arcs -ftest-coverage --coverage
# coverage optimization flags: -fprofile-use or -fprofile-use=path
# optimization flags: -O3 -funroll-loops -fpeel-loops -ffast-math -march=native -ffat-lto-objects -flto
# debug flags: -D_GLIBCXX_DEBUG_PEDANTIC -D_GLIBCXX_ASSERTIONS -D_GLIBCXX_DEBUG
# sanitizer flags: -fsanitize=address -fno-omit-frame-pointer-fsanitize=bounds-strict -fsanitize=undefined -fsanitize=bounds -fsanitize=leak

alias ux='chmod +x'
alias wl='wc -l'

lv() { _ext-glob ls *~"$@" }
llv() { _ext-glob ls -l *~"$@" }
alias lv='noglob lv'
alias llv='noglob llv'

# some more cd aliases
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias '.....'='cd ../../../..'
alias -- -='cd -'
alias -- _='cd -'

alias md='mkdir -p'
alias rd=rmdir
zhead() { echo ${(F)${(f)"$(<$2)"}[1,$1]} }
alias d='echo ${(F)${(f)"$(dirs -v)"}[1,10]}'

alias tmp='cd ~/rawdisk2'

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# some more grep aliases
alias f='zg -a'
alias fx='zg -xa'
alias g=grep
alias eg='grep -E'
alias gf='grep -l'
alias gf1='grep -lm1'
alias g1='grep -m1'

# altermative grep: ripgrep
# alias ripgrep=/usr/bin/rg
alias rg='/usr/bin/rg --no-heading'

function m() {
  [ $# -lt 1 ] && echo "Usage: $0 missing directory" >&2 && return 1
  mkdir -p "$@" && cd -- "$1"
}

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
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias gs='git status -s'
alias gss='git status'

alias gd='git diff'
alias gdc='git diff --word-diff-regex=.'
alias gdw='gd --word-diff-regex=\\w+'
alias gdww='git diff --word-diff'
alias gd0='gd --unified=0'
alias gdc0='gdc --unified=0'
alias gdw0='gdw --unified=0'
alias gdww0='gdww --unified=0'
alias cgd='GIT_PAGER=cat gd'
alias cgdc='GIT_PAGER=cat gdc'
alias cgdw='GIT_PAGER=cat gdw'
alias cgdww='GIT_PAGER=cat gdww'
alias cgd0='GIT_PAGER=cat gd0'
alias cgdc0='GIT_PAGER=cat gdc0'
alias cgdw0='GIT_PAGER=cat gdw0'
alias cgdww0='GIT_PAGER=cat gdww0'
alias gds='GIT_PAGER=cat git diff --stat'

alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'

alias glgg='git log --stat --pretty=tformat:"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ar)%Creset" -n4'
alias cglg='GIT_PAGER=cat glgg'
alias glg='GIT_PAGER=cat git log --graph --pretty=tformat:"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ar)%Creset" -n10'
#alias glog='GIT_PAGER=cat git log --oneline --decorate --color --graph -n10'


function git_current_branch () {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# these aliases take advantage of the previous function
alias gl='git pull origin $(git_current_branch)'
alias gp='git push origin $(git_current_branch)'
# alias glp='git pull origin $(git_current_branch) && git push origin $(git_current_branch)'

alias glr='gl --rebase'


# some more diff aliases
alias diff=colordiff
alias cdiff='colordiff --normal'
alias yd='colordiff -y -W $COLUMNS'
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

a() { echo $(($*)) }

#alias brightness='xrandr --output LVDS-0 --brightness'

#function jhibernate(){
#  sudo pm-hibernate
#  #sleep 2
#  #qdbus org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness 33 >/dev/null
#  xmodmap ~/.Xmodmap
#}
#alias jhibernate='sudo pm-hibernate'

alias isearch='search -i'

function man(){
  # mb  Start blinking
  # md  Start bold mode
  # me  End all mode like so, us, mb, md and mr
  # so  Start standout mode
  # se  End standout mode
  # us  Start underlining
  # ue  End underlining
  env \
  LESS_TERMCAP_md=$'\e[0;31m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[0;32m' \
  man "$@"
  # LESS_TERMCAP_so=$'\e[7m'
}

# alias qdbus=/usr/lib/x86_64-linux-gnu/qt4/bin/qdbus

mem() { ps h -C"$*" -o fname,rss }
psg() { zg -ac "$*" ps aux }

swap() {
  mv "$1" /tmp/swap-$$.tmp && \
  mv "$2" "$1" && \
  mv /tmp/swap-$$.tmp "$2"
}

autoload er erd
alias err='erd ~/Videos'

bak() { cp "$1" "$1"_`date +%H:%M:%S_%d-%m-%Y` ; }

k() { awk "{ print $@ }" ; }

alias hi='XDG_DATA_DIRS=~/game vt-kate-syntax-highlighter -tMy'
alias ihi='hi -s'
hin() { hi "$@" | cat -n ; }
ihin() { ihi "$@" | cat -n ; }

alias n=nano
alias nn='nano -$'
# my feh fork
alias ii='~/projects/feh/src/feh --begin-top -Z --fontpath '$HOME/projects/feh/share/fonts
alias i=imv
alias x=xpdf
alias t=tree
alias td='tree -d'
alias ta='tree -a'
alias tp='tree -p'
alias ts='tree -sh'
alias v=vim
alias s=sed
p() { mpv -af scaletempo --really-quiet -fs --speed=1.61 "$@" ; } # auto-complete only for files

alias mmcal="gcal -H '\e[01;33m:\e[0m:\e[31m:\e[0m' -s1 -q FR -N"
alias mcal="mmcal .+"

alias bjam='bjam --build-dir=/home/jonathan/projects/build'

vg() { valgrind --suppressions=/home/jonathan/projects/dotfiles/usr/lib/valgrind/dl_init.supp "$@" 2> >(colout -t valgrind) ; }
alias vgl='vg --leak-check=full --show-leak-kinds=all'

y() { youtube-dl --no-part -k --no-mtime --youtube-skip-dash-manifest --merge-output-format none --ffmpeg-location ~/rawdisk --no-playlist "$@" ; }

alias ak=/usr/bin/ag
alias na='cat -n'

autoload defl def

## yaourt / pacman

# https://wiki.archlinux.fr/Pacman
# https://wiki.archlinux.org/index.php/Pacman/Rosetta

alias acs='yaourt -Ss' # search

alias ag='yaourt -Su' # upgrade
alias ad='yaourt -Sy' # update / refresh info
alias adg='yaourt -Syu' # update and upgrade
alias adga='yaourt -Syua' # update then upgrade + AUR

alias ai='yaourt' # install
alias ain='yaourt -S' # install exactly
alias ar='yaourt -R' # removes
#alias ap='yaourt -Rs' # + dependancies
alias ap='yaourt -Rsn' # + config
# alias di='yaourt -U' # installs local package file

alias aci='pacman -Qi' # info
# alias aci='pacman -Si' # info without suggestion

# alias afl='pacman -Fl'
alias afl='pkgfile -l' # list file
# alias afs='pacman -Fo'
# alias afs='pacman -Fs'
alias afs='pkgfile -sr' # search with regex

# /var/cache/pacman/pkg/
# alias aac='pacman -Sc' # empty the cache
alias aac='paccache -r' # ... except the last three latest versions
alias aacc='paccache -ruk0' # + uninstalled

#alias 'pacman -Qc' # changelog

# alias deborphan='pacman -Qm' # List packages that are installed but are not available in any installation source (anymore).
# alias 'deborphan -anp1'='pacman -Qt' # List packages not required by any other package

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

#alias ..='cd ..'

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
# alias 6='cd -6'
# alias 7='cd -7'
# alias 8='cd -8'
# alias 9='cd -9'


## aliases

autoload _ext-glob
alias ex='noglob _ext-glob ' # delay globbing until inside (ex echo .(#i)ic*)

autoload _nocase-glob
alias ix='noglob _nocase-glob'

alias a='noglob a'
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
alias -g F='|zg -a'
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
alias -g F2='|&zg -a'
alias -g S2='|&sed'
alias -g K2='|&k'
alias -g A2='|&awk'
alias -g W2='|&while read'
alias -g X2='|&xargs -d\\n'
alias -g Z2='|&fzf -m --cycle --reverse --no-sort -m --ansi --tiebreak=index --no-sort'

alias -g C='--color=always'
alias -g ZF='|fo'

col() { for l in ${(f)"$(<$1)"} ; echo ${${(Az)l}[$2]} }
colx() { for l in ${(f)"$(eval ${(q)@[2,$]})"} ; echo ${${(Az)l}[$1]} }
alias -g @@='|col /dev/stdin'

## functions

#function zsh_stats() {
#  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
#}

function fo {
  local r=(${(f)"$(fzf --height 40% --cycle --reverse --no-sort -m -n3..,1 -d: --ansi --tiebreak=index)"})
  "$@" ${(uq)${r/:*/}}
}

function gfo {
  g -nH --color=always "$@[2,$]" |fo $1
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

# menuselect navigation
bindkey -M menuselect -s 'á' '^[[A^[[A^[[A^[[A^[[A' # AltGr+A  top *5
bindkey -M menuselect -s 'ð' '^[[B^[[B^[[B^[[B^[[B' # AltGr+D  bottom *5
bindkey -M menuselect -s 'å' '^[[A'                 # AltGr+W  top
bindkey -M menuselect -s 'ß' '^[[B'                 # AltGr+S  bottom
bindkey -M menuselect -s 'æ' '^[[D'                 # AltGr+Z  left
bindkey -M menuselect -s '©' '^[[C'                 # AltGr+C  tight

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

autoload goto-previous-arg goto-next-arg kill-arg transpose-arg
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

function kill-prev-char-region()
{
  zle set-mark-command
  zle vi-find-prev-char
  zle kill-region
}
zle -N kill-prev-char-region
bindkey '^X^K' kill-prev-char-region

autoload prefix-cmd-widget
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

autoload _jln-pick
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

# export LC_CTYPE=$LANG


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

autoload smart_sudo
alias sudo='nocorrect noglob smart_sudo'
compdef _sudo smart_sudo

autoload insert-sudo-and-accept
zle -N insert-sudo-and-accept
bindkey "\e\e" insert-sudo-and-accept

autoload insert-space-and-accept
zle -N insert-space-and-accept
bindkey "^[j" insert-space-and-accept

alias clipcopy='xclip -selection clipboard'

copybuffer () {
  echo -n $BUFFER | clipcopy
}
zle -N copybuffer
#bindkey "^[o" copybuffer

# b() { LD_PRELOAD=$HOME/lib/qt5noblink.so kate ~/projects/blog/content/post/"$@" }
# bb() { LD_PRELOAD=$HOME/lib/qt5noblink.so kdevelop ~/projects/blog/content/post/"$@" }
# _blog_file_completion () { local a=(~/projects/blog/content/post/*(om)) ; reply=(${a:t}) }
# compctl -K _blog_file_completion -M 'r:|[_[:lower:]]=** r:|=*' b bb

rand() REPLY=$RANDOM
