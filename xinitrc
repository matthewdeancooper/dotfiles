#------------------------------
# Wallpaper
#-----------------------------
# feh --bg-fill ~/Pictures/wallpaper/wp-notext.png

#------------------------------
# Variables
#------------------------------
# export TERM="st-256color"
# export EDITOR="nvim"
# export BROWSER="fireox"
# export READER="zathura"
# export FILE="ranger"


export TERMINAL="ansi-term"
export EDITOR="emacs"
export BROWSER="firefox"
export READER="emacs"
export FILE="emacs"

# export PYTHONPATH=$PYTHONPATH:/home/matthew/my_py_modules

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
# slstatus &
# clipmenud &
mykeymap &
mydualscreen &
# checkbatt &
udiskie &
juiced -d &
dunst > /dev/null 2>&1 &
# (emacs --daemon)&


#------------------------------
# WM
#------------------------------
# exec stumpwm

# while true; do
#     #     # Log stderror to a file
#     #     # dwm 2> ~/.dwm.log
#     #     # No error logging
#     dwm >/dev/null 2>&1
# done

exwm-start
