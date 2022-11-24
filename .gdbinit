#set prompt > 
#set prompt \033[;31m(gdb)\033[0m 
#source ~/peda/peda.py
set history save on
#set print pretty on

#https://sourceware.org/gdb/onlinedocs/gdb/Print-Settings.html
# set print raw frame-arguments off
set print frame-arguments all
#set print elements 33

# Don't wrap line or the coloring regexp won't work.
#set width 0

# set debuginfod enabled ask
set debuginfod enabled off
