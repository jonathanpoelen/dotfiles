set prompt > 
#set prompt \033[;31m(gdb)\033[0m 
#source ~/peda/peda.py
set history save on
#set print pretty on

#https://sourceware.org/gdb/onlinedocs/gdb/Print-Settings.html
set print raw frame-arguments off
set print frame-arguments all
#set print elements 33

# Don't wrap line or the coloring regexp won't work.
set width 0

# Create a named pipe to get outputs from gdb
shell test -e /home/jonathan/rawdisk2/coloutPipe && rm /home/jonathan/rawdisk2/coloutPipe
shell mkfifo /home/jonathan/rawdisk2/coloutPipe

define logging_on
  # Instead of printing on stdout only, log everything...
  set logging redirect on
  # ... in our named pipe.
  set logging on /home/jonathan/rawdisk2/coloutPipe
end

define logging_off
  set logging off
  set logging redirect off
  # Because both gdb and our commands are writing on the same pipe at the same
  # time, it is more than probable that gdb will end before our (higher level)
  # commands.  The gdb prompt will thus render before the result of the command,
  # which is highly akward. To prevent this, we need to wait before displaying
  # the prompt again.  The more your commands are complex, the higher you will
  # need to set this.
  shell sleep 0.1s
end

define hook-backtrace
    # match the [path]file[.ext]: (.*/)?(?:$|(.+?)(?:(\.[^.]*)|))
    shell cat /home/jonathan/rawdisk2/coloutPipe | colout "^(#)([0-9]+)\s+(0x\S+ )*(in )*(\S+) (\(.*\)) at (.*/)?(?:$|(.+?)(?:(\.[^.]*)|)):([0-9]+)" red red blue none green green magenta white white yellow &
    logging_on
end
define hookpost-backtrace
    logging_off
end

# Don't forget to clean the adhoc pipe.
define hook-quit
    shell rm -f /home/jonathan/rawdisk2/coloutPipe
end

