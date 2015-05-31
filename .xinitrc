RAWDISK=/home/jonathan/rawdisk

mount -t tmpfs -o size=128M tmpfs "$RAWDISK" && mkfifo "$RAWDISK"/music-control
#rmmod intel_powerclamp

# left button + right button = middle button
xinput --set-prop "Logitech USB Trackball" "Evdev Middle Button Emulation" 1 2>/dev/null
if [ "$?" != 0 ] ; then
  # button 9 + mouse = scroll
  xinput --set-prop "Logitech USB Trackball" "Evdev Wheel Emulation" 1
  xinput --set-prop "Logitech USB Trackball" "Evdev Wheel Emulation Button" 9
  #xinput --set-prop "Logitech USB Trackball" "Evdev Wheel Emulation Timeout" 200
  #xinput --set-prop "Logitech USB Trackball" "Evdev Wheel Emulation Axes" 6 7 4 5
fi

nohup xbindkeys > /dev/null &
