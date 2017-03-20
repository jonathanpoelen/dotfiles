# kate: syntax bash
# enable color support of ls and also add handy aliases

export EDITOR=nano
export LESS=-Rj3

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

export ASAN_SYMBOLIZER_PATH=/usr/lib/llvm-3.7/bin/llvm-symbolizer

alias g++-7=/usr/lib/gcc-snapshot/bin/g++

alias g++='g++ -fdiagnostics-color=always'
alias g11='g++ -fdiagnostics-color=always -std=c++11'
alias g14='g++ -fdiagnostics-color=always -std=c++14'
alias g1z='g++ -fdiagnostics-color=always -std=c++1z'
alias g1z-7='g++-7 -fdiagnostics-color=always -std=c++1z'
alias g14-7='g++-7 -fdiagnostics-color=always -std=c++14'

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=00;37:quote=00;32'

# -Wstrict-overflow=1 # -Wall
# -Wstrict-overflow=2
# -Wstrict-overflow=3
# -Wstrict-overflow=4
# -Wstrict-overflow=5
# -Wstrict-default # bad idea
# -Wmissing-format-attribute
cxxflag='-Wall -Wextra -pedantic -Wcast-align -Wcast-qual -Wdisabled-optimization -Wfloat-equal -Wformat-security -Wformat-signedness -Wformat=2 -Wmissing-declarations -Wmissing-include-dirs -Wnon-virtual-dtor -Wold-style-cast -Woverloaded-virtual -Wpacked -Wredundant-decls -Wundef -Wuninitialized -Wunused-macros -Wvla -Wswitch -Wconversion -Wduplicated-cond -Wnull-dereference -fsized-deallocation -Warray-bounds=2 -Wconditionally-supported -Wnoexcept -Wsized-deallocation -Wstrict-null-sentinel -Wsuggest-override -Wconditionally-supported -Wfloat-conversion -Wopenmp-simd -Wuseless-cast -Wsuggest-attribute=noreturn -Wzero-as-null-pointer-constant -Wlogical-op -Wvector-operation-performance -Wdouble-promotion -Wtrampolines -Winline'
alias gw++="g++ $cxxflag"
alias gw11="g11 $cxxflag"
alias gw14="g14 $cxxflag"
alias gw1z="g1z $cxxflag -Wmisleading-indentation"
alias gw1zz="g1z-7 $cxxflag -Wmisleading-indentation"
alias gw14-7="g14-7 $cxxflag -Wmisleading-indentation"
unset cxxflag

cxxflag='-Weverything -Wno-shadow -Wno-effc++ -Wno-padded -Wno-c++98-compat -Wno-exit-time-destructors -Wno-global-constructors -Wno-gnu-zero-variadic-macro-arguments -Wno-disabled-macro-expansion -Wno-documentation-unknown-command -Wno-documentation -Wno-missing-prototypes -Wno-c++98-compat-pedantic'
export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-3.7
alias cw++="clang++ $cxxflag -fcolor-diagnostics"
alias cw11="clang++ $cxxflag -fcolor-diagnostics -std=c++11"
alias cw14="clang++ $cxxflag -fcolor-diagnostics -std=c++14"
alias cw1z="clang++ $cxxflag -fcolor-diagnostics -std=c++1z"
unset cxxflag

# coverage flags: -fprofile-arcs -ftest-coverage --coverage
# coverage optimization flags: -fprofile-use or -fprofile-use=path
# optimization flags: -O3 -funroll-loops -fpeel-loops -ffast-math -march=native -ffat-lto-objects -flto
# debug flags: -D_GLIBCXX_DEBUG_PEDANTIC -D_GLIBCXX_ASSERTIONS -D_GLIBCXX_DEBUG
# sanitizer flags: -fsanitize=bounds-strict -fsanitize=bounds-strict -fsanitize=bounds -fsanitize=undefined -fsanitize=leak -fsanitize=address -fno-omit-frame-pointer


alias e=kwrite

alias ux='chmod u+x'
alias wl='wc -l'
#alias lc='wc -l'

if [ ! -z "$BASH" ]; then
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

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

alias gocode='cd ~/Code'
alias gocpp='cd ~/Code/cpp'
alias goshell='cd ~/Code/shell'
#alias godl='cd ~/Downloads'
alias godoc='cd ~/Documents'
#alias godesktop='cd ~/Desktop'
alias goscan='cd ~/Scans'
alias govideo='cd ~/Videos'
#alias gomusic='cd ~/Music'
#alias gopicture='cd ~/Pictures'
alias goproject='cd ~/projects'
alias goconfig='cd ~/projects/configs'
if [ ! -z "$BASH" ]; then
  f () {
    if [ $# = 0 ] ; then cd ~/projects/falcon
    else
      cd ~/projects/falcon/"$1"* 2>/dev/null || cd ~/projects/falcon/*"$1"*
    fi
  }
else
  f () {
    if [ $# = 0 ] ; then cd ~/projects/falcon
    else
      local files=(~/projects/falcon/"$1"*)2>/dev/null || local files=(~/projects/falcon/*"$1"*)
      [ -d "${files[1]}" ] && cd "${files[1]}"
    fi
  }
fi
alias gobd='cd ~/BD'
alias goh='cd ~/Desktop/h'
alias tmp='cd ~/rawdisk2'

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
# alias ig='grep -i'
# alias rig='grep -ir'
# alias reg='grep -Er'
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

function m() {
  [ $# -lt 1 ] && echo "Usage: $0 missing directory" >&2 && return 1
  mkdir -p "$@" && cd -- "$1"
}

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
alias gsh='git stash'
alias gst='git status'
alias gpo='git push origin'
alias glo='git pull origin'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gc!='git commit --amend'
alias gca!='git commit --amend -a'
_gcm() { git commit -v -m "$*" ; }
_gcmm() { git commit --amend -m "$*" ; }
_gcam() { git commit -v -a -m "$*" ; }
_gcamm() { git commit --amend -a -m "$*" ; }
alias gcm='noglob _gcm'
alias gcm!='noglob _gcmm'
alias gcam='noglob _gcam'
alias gcam!='noglob _gcamm'
alias goops='git commit -v --amend --no-edit'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias gs='git status -s'
alias gst='git status'
alias gd='git diff'
alias gdc='git diff --word-diff-regex=.'
alias gdw='gd --word-diff-regex=\\w+'
alias gdww='git diff --word-diff'
alias gd0='gd --unified=0'
alias gdc0='gdc --unified=0'
alias gdw0='gdw --unified=0'
alias gdww0='gdww --unified=0'
alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias glg='git log --stat --pretty=tformat:"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ar)%Creset" --max-count=4'
alias glgg='GIT_PAGER=cat git log --graph --pretty=tformat:"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ar)%Creset" --max-count=15'
#alias glo='GIT_PAGER=cat git log --oneline --max-count=15'
alias cgd='GIT_PAGER=cat git diff'
alias cgdc='GIT_PAGER=cat git diff --word-diff-regex=.'
alias cgdw='GIT_PAGER=cat git diff --word-diff-regex=\\w+'
alias cgdww='GIT_PAGER=cat git diff --word-diff'
alias cgd0='cgd --unified=0'
alias cgdc0='cgdc --unified=0'
alias cgdw0='cgdw --unified=0'
alias cgdww0='cgdww --unified=0'

function git_current_branch () {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}
function git_current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# these aliases take advantage of the previous function
alias gl='git pull origin $(git_current_branch)'
alias gp='git push origin $(git_current_branch)'
alias glp='git pull origin $(git_current_branch) && git push origin $(git_current_branch)'


# some more diff aliases
alias diff=colordiff
alias yd='colordiff -W $COLUMNS -y'
cwdiff() { wdiff -n "$@" | colordiff ; }
cdwdiff() { dwdiff -n "$@" | colordiff ; }


function calc(){
  echo $(($*))
}

#alias brightness='xrandr --output LVDS-0 --brightness'

function jhibernate(){
  sudo pm-hibernate
  #sleep 2
  #qdbus org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness 33 >/dev/null
  #xmodmap ~/.Xmodmap
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
  # LESS_TERMCAP_so=$(printf "\e[0;40;39m")
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
        *.zip)            unzip "$f"      ;;
        *.tar)            tar xf "$f"     ;;
        *.rar|*.cbr)      unrar x "$f"    ;;
        *.tar.bz2|*.tbz2) tar xjf "$f"    ;;
        *.tar.gz|*.tgz)   tar xzf "$f"    ;;
        *.tar.xz)         tar xJf "$f"    ;;
        *.bz2)            bunzip2 "$f"    ;;
        *.gz)             gunzip "$f"     ;;
        *.Z)              uncompress "$f" ;;
        *.7z)             7z x "$f"       ;;
        *)     echo "$0: '$f' cannot be extracted via extract()" >&2 ; return 2;;
      esac
    else
      echo "$0: '$f' is not a valid file" >&2 ; return 1
    fi
  done
}

bak() { cp "$1" "$1"_`date +%H:%M:%S_%d-%m-%Y` ; }

alias c1='awk { print $1 }'
alias c2='awk { print $2 }'
alias c3='awk { print $3 }'
alias c4='awk { print $4 }'
alias c5='awk { print $5 }'
alias c6='awk { print $6 }'
alias c7='awk { print $7 }'
alias c8='awk { print $8 }'
alias c9='awk { print $9 }'
col() { awk '{ print $'$1' }' ; }
k() { awk "{ print $@ }" ; }

alias hi='source-highlight -f esc -i'
alias hin='source-highlight -f esc -n -i'
alias ihi='source-highlight -f esc -s'
alias ihin='source-highlight -f esc -n -s'
alias n=nano
alias i='feh -Z'
alias x=xpdf
alias t=tree
alias td='tree -d'
alias ta='tree -a'
alias v=vim
alias s=sed
alias a=calc
p() { mpv -af scaletempo --really-quiet -fs --speed=1.61 "$@" ; } # auto-complete only for files

alias mmcal="gcal -H '\e[01;33m:\e[0m:\e[31m:\e[0m' -s1 -q FR -N"
alias mcal="mmcal .+"

vg() { valgrind --suppressions=/home/jonathan/projects/configs/usr/lib/valgrind/dl_init.supp "$@" 2> >(colout -t valgrind) ; }
alias vgl='vg --leak-check=full --show-leak-kinds=all'
