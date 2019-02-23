#------------------------------
# Wallpaper 
#------------------------------
feh --bg-tile ~/Pictures/wp-notext.png 

#------------------------------
# Variables
#------------------------------
export TERM="st-256color"
# export TERMINAL="st"
export EDITOR="nvim"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#------------------------------
# User configuration
#------------------------------
xbacklight -set 50

#------------------------------
# Start 
#------------------------------
slstatus &
clipmenud &
mykeymap &
checkbatt &
thunderbird &
signal-desktop &


#------------------------------
# WM 
#------------------------------
while true; do
    # Log stderror to a file 
    # dwm 2> ~/.dwm.log
    # No error logging
    dwm >/dev/null 2>&1
done
