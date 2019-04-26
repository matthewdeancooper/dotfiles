#------------------------------
# Wallpaper
#-----------------------------
feh --bg-fill ~/Pictures/wallpaper/wp-notext.png

#------------------------------
# Variables
#------------------------------
export TERM="st-256color"
# export TERMINAL="st"
# export EDITOR="emacs"
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
# Set backlight
light -S 30

#------------------------------
# Start
#------------------------------
slstatus &
clipmenud &
mykeymap &
checkbatt &
udiskie &
#(emacs --daemon)&
# firefox &


#------------------------------
# WM
#------------------------------
while true; do
#     # Log stderror to a file
#     # dwm 2> ~/.dwm.log
#     # No error logging
    dwm >/dev/null 2>&1
done
