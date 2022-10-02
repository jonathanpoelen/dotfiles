export QT_QPA_PLATFORMTHEME='qt5ct'
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix 'xdg-open fork-bomb' export your preferred browser from here
export BROWSER=/usr/bin/firefox
export TMPDIR=/home/jonathan/rawdisk
#export GTK_OVERLAY_SCROLLING=0
export DEBUGINFOD_URLS='https://debuginfod.archlinux.org'

if ! pgrep -U `whoami` -x 'ssh-agent' >/dev/null; then
  ssh-agent -s > ~/rawdisk/.ssh-agent.sh
fi
. ~/rawdisk/.ssh-agent.sh
