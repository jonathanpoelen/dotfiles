# kate: syntax bash
# enable color support of ls and also add handy aliases

export EDITOR=nano

# for gcc and others
export TMPDIR=/home/jonathan/rawdisk

export RLWRAP_HOME=/home/jonathan/.rlwrap

if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
	alias rgrep='rgrep --color=auto'

	#alias wcgrep='wcgrep --color=auto'

	GREP_COLOR='1;31'
fi

# some more ls aliases
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias lr='ls -R'
alias llr='ls -ClRh'
alias lla='ls -ClAh'
alias l1='ls -1'
alias l.='ls -d .*'
alias lh='ls -sh'
# alias sl=ls # often screw this u

function lll() {
	ls -l "$@" | less
	return $?
}

alias cr='cp -R'

alias c='cat'

alias j='jobs'

alias h='history'
function hs {
	history | grep "$@"
}
alias hsi='hs -i'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# alias gcc-4.9=/usr/lib/gcc-snapshot/bin/gcc

alias g++-6=/usr/lib/gcc-snapshot/bin/g++

# alias gcc11='gcc-4.9 -std=c11'
# alias gcc1x='gcc-4.8 -std=c1x'

alias g++='g++ -fdiagnostics-color=always'
alias g11='g++ -fdiagnostics-color=always -std=c++11'
alias g1y='g++ -fdiagnostics-color=always -std=c++1y'
alias g1z='g++-6 -fdiagnostics-color=always -std=c++1z'
alias g1y-6='g++-6 -fdiagnostics-color=always -std=c++1y'

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=00;33:quote=00;32'

# alias colorgcc11='colorgcc-4.8 -std=c11'
# alias colorgcc1y='gcc-4.9 -fdiagnostics-color=always -std=c11'
#alias colorg++="g++ -fdiagnostics-color=always -std=c++11"
#alias colorg++-6="g++-6 -fdiagnostics-color=always -std=c++11"


flag='-Wall -Wextra -Weffc++ -Wswitch-default -Wswitch-enum -Wlogical-op -Wundef -Wcast-align -Wformat-security -Wunreachable-code -Wformat=2 -Wfloat-equal -Wshadow -Wpointer-arith -Wconversion -Wmissing-declarations -Wmissing-noreturn -Wmissing-format-attribute -Wpacked -Wredundant-decls -Winline -Wdouble-promotion -Wcast-qual -pedantic -Wvla'
# cflag=$flag' -Wstrict-prototypes -Wbad-function-cast -Wmissing-prototypes -Wnested-externs -Waggregate-return -Wwrite-strings -Winit-self'
cxxflag=$flag' -Wold-style-cast -Woverloaded-virtual -Wnon-virtual-dtor'
unset flag

# alias gwcc="gcc-4.8 $cflag -Wlong-long"
# alias gwcc1x="gcc-4.8 $cflag -std=c1x"

# alias colorgwcc="colorgcc-4.8 $cflag -Wlong-long"
# alias colorgwcc1x="colorgcc-4.8 $cflag -std=c1x"

# unset cflag

alias gw++="g++ $cxxflag"
alias gw11="g11 $cxxflag"
alias gw1y="g1y $cxxflag"
alias gw1z="g1z $cxxflag"
alias gw1y-6="g1y-6 $cxxflag"

unset cxxflag

cxxflag='-Weverything -Wno-c++98-compat -Wno-exit-time-destructors -Wno-global-constructors -Wno-gnu-zero-variadic-macro-arguments -Wno-disabled-macro-expansion -Wno-documentation-unknown-command -Wno-documentation -Wno-missing-prototypes'
export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-3.7
alias clangw++="clang++ $cxxflag -fcolor-diagnostics"
alias clangw11="clang++ $cxxflag -fcolor-diagnostics -std=c++11"
alias clangw1y="clang++ $cxxflag -fcolor-diagnostics -std=c++1y"
alias clangw1z="clang++ $cxxflag -fcolor-diagnostics -std=c++1z"
unset cxxflag

# optimize flags compiler: -O3 -funroll-loops -fpeel-loops -ffast-math -march=native -ffat-lto-objects


alias e=kwrite

alias ux='chmod u+x'
alias wl='wc -l'
#alias lc='wc -l'

if [ "$SHELL" = 'bash' ]; then
  alias lve='/home/jonathan/Code/shell/lv.sh -E'
  alias lva='/home/jonathan/Code/shell/lv.sh -a'
  alias lvae='/home/jonathan/Code/shell/lv.sh -Ea'
else
  function lv {
    extglob ls *~"$@"
  }
  function llv {
    extglob ls -l *~"$@"
  }
  function lva {
    extglob ls -a *~"$@"
  }
  function llva {
    extglob ls -la *~"$@"
  }
  alias lv='noglob lv'
  alias llv='noglob llv'
  alias lva='noglob lva'
  alias llva='noglob llva'
fi

# some more cd aliases
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias '.....'='cd ../../../..'
alias -- -='cd -'

alias gocode='cd ~/Code'
alias gocpp='cd ~/Code/cpp'
# alias gophp='cd ~/Code/php'
# alias gojs='cd ~/Code/javascript'
# alias gojquery='cd ~/Code/jquery'
# alias gohtml='cd ~/Code/html\ css'
alias goshell='cd ~/Code/shell'
alias goproject='cd ~/projects'
#alias godl='cd ~/Downloads'
alias godoc='cd ~/Documents'
#alias godesktop='cd ~/Desktop'
alias goscan='cd ~/Scans'
#alias govideo='cd ~/Videos'
#alias gomusic='cd ~/Music'
#alias gopicture='cd ~/Pictures'
alias gofalcon='cd ~/projects/falcon/falcon'
#alias gosw='cd ~/projects/sunwars\ v2/newgame'
alias gobd='cd ~/BD'
alias goh='cd ~/Desktop/h'
#alias tmp='cd /tmp'
alias tmp='cd ~/rawdisk2'
alias goregex='cd ~/project/falcon.regex-dfa'

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

#alias afind='ack-grep -il'

# some more grep aliases
# alias igrep='grep -i'
# alias rigrep='grep -ir'
alias g='grep'
alias rg='grep -r'
alias eg='grep -E'
alias ig='grep -i'
alias rig='grep -ir'
alias reg='grep -Er'
# alias rieg='grep -iEr'
# alias vg='grep -v'
# alias rvg='grep -rv'
# alias gve='grep -vE'
# alias gvi='grep -vi'
# alias virg='grep -vir'
# alias verg='grep -vEr'
# alias vieg='grep -viE'
# alias vierg='grep -viEr'
alias gf='grep -l'
alias gf1='grep -lm1'
# alias rgf='grep -rl'
# alias igf='grep -il'
# alias rigf='grep -irl'
# alias vgf='grep -vrl'
# alias rgvf='grep -vrl'
# alias egl='grep -El'
# alias ergl='grep -Erl'
# alias vegl='grep -vErl'
# alias vergl='grep -vErl'
alias g1='grep -m1'
# alias rg1='grep -rm1'
# alias ig1='grep -m1'
# alias irg1='grep -irm1'
# alias vg1='grep -vrm1'
# alias vrg1='grep -vrm1'
# alias eg1='grep -Em1'
# alias erg1='grep -Erm1'
# alias veg1='grep -vErm1'
# alias verg1='grep -vErm1'

function mdcd() {
	[ $# -lt 1 ] && echo "Usage: $0 missing directory" >&2 && return 1
	mkdir -p "$@" && cd -- "$1"
}
alias mdm=mdcd

# alias aptupdate='sudo apt-get update'
# alias aptupgrade='sudo apt-get upgrade'
# alias aptsearch='apt-cache search'
# alias aptinstall='sudo apt-get install'
# alias aptremove='sudo apt-get remove'
function acf() {
	if [ -z "$1" ] ; then
		echo $0 regex filter >&2
		return 1
	elif [ -z "$2" ] ; then
		apt-cache search "$1" | grep -i "$1"
	else
		apt-cache search "$1" | grep -i "$2"
	fi
}

# some more git aliases
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gc!='git commit --amend'
alias gca!='git commit --amend -a'
alias gcm='git commit -v -m'
alias gcam='git commit -v -a -m'
alias goops='git commit -v --amend --no-edit'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias gss='git status -s'
alias gst='git status'
alias gd='git diff'
alias gdc='git diff --word-diff-regex=.'
alias gdw='gd --word-diff-regex=\\w+'
alias gdww='git diff --word-diff'
alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias glg='git log --stat --pretty=tformat:"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ar)%Creset" --max-count=4'
alias glgg='GIT_PAGER=cat git log --graph --pretty=tformat:"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ar)%Creset" --max-count=15'
alias glo='GIT_PAGER=cat git log --oneline --max-count=15'
alias cgd='GIT_PAGER=cat git diff'
alias cgdc='GIT_PAGER=cat git diff --word-diff-regex=.'
alias cgdw='GIT_PAGER=cat git diff --word-diff-regex=\\w+'
alias cgdww='GIT_PAGER=cat git diff --word-diff'

function git_current_branch () {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}
function git_current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias ggpnp='git pull origin $(git_current_branch) && git push origin $(git_current_branch)'

function calc(){
	echo $(($*))
}

#alias brightness='xrandr --output LVDS-0 --brightness'

function jhibernate(){
	sudo pm-hibernate
	sleep 2
	#qdbus org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness 33 >/dev/null
	xmodmap ~/.Xmodmap
}
#alias jhibernate='sudo pm-hibernate'

alias isearch='search -i'

source ~/.bash_aliases_apt

function man(){
	env \
	LESS_TERMCAP_md=$(printf "\e[0;31m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[0;32m") \
	man "$@"
#   LESS_TERMCAP_so=$(printf "\e[0;40;39m")
}

# alias qdbus=/usr/lib/x86_64-linux-gnu/qt4/bin/qdbus

function mem {
  ps h -C"$*" -o fname,rss
}

function psg {
  ps aux | grep "$1"
}

function swap {
  mv "$1" /tmp/swap-$$.tmp && \
  mv "$2" "$1" && \
  mv /tmp/swap-$$.tmp "$2"
}

function extract {
  for f in "$@" ; do
    if [ -f "$f" ] ; then
      case "$f" in
        *.tar.bz2|*.tbz2) tar xjf "$f"    ;;
        *.tar.gz|*.tgz)   tar xzf "$f"    ;;
        *.bz2)            bunzip2 "$f"    ;;
        *.rar|*.cbr)      unrar x "$f"    ;;
        *.gz)             gunzip "$f"     ;;
        *.tar)            tar xf "$f"     ;;
        *.zip)            unzip "$f"      ;;
        *.Z)              uncompress "$f" ;;
        *.7z)             7z x "$f"       ;;
        *)     echo "$0: '$f' cannot be extracted via extract()" >&2 ; return 2;;
      esac
    else
      echo "$0: '$f' is not a valid file" >&2 ; return 1
    fi
  done
}

function bak {
  cp "$1" "$1"_`date +%H:%M:%S_%d-%m-%Y`
}

alias hi='source-highlight -f esc -i'
alias hin='source-highlight -f esc -n -i'
alias ihi='source-highlight -f esc -s'
alias ihin='source-highlight -f esc -n -s'
alias n=nano
alias i='feh -Z'
mp() { mpv -af scaletempo --really-quiet "$@" ; } # auto-complete only for files

alias mcal="gcal -H '\e[01;33m:\e[0m:\e[31m:\e[0m' -s1 -q FR -N -b3 .+"

function vg {
  valgrind --suppressions=/home/jonathan/projects/configs/usr/lib/valgrind/dl_init.supp "$@" |& colout -t valgrind
}
alias vgl='vg --leak-check=full --show-leak-kinds=all'

function bt {
  esc="$(echo -e "\e")"
  gdb -q -ex r -ex bt "$@" <<< '' |& ihi cpp |& \
  sed -E '/ +at/{
    s/.\[[0-9]*m//g;
    s#at (.*/)([a-zA-Z0-9_-]+\.[ch]pp:[0-9]+)$#at '$esc'[48;2;33;33;33m\1'$esc'[1;33;48;2;44;44;44m\2'$esc'[m#
  }'
}

function qbt {
  gdb -q -ex r -ex bt "$@" <<< '' | grep -C11 ' at .\+:[0-9]\+$'
}
