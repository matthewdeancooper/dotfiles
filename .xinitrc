 # feh --bg-tile ~/media/scrot/Oct05::193718.png
#------------------------------
# PATH
#------------------------------
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#------------------------------
# User configuration
#------------------------------
# Set backlight
lux -S 30%

#------------------------------
# Variables
#------------------------------

export TERM=xterm-256color
export EDITOR="nvim"
export BROWSER="fireox"
# export READER="zathura"
export FILE="ranger"

# export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
# export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode
# export READER="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode

#------------------------------
# Start
#------------------------------
#
#
wmname LG3D &
clipmenud &
mykeymap &
udiskie &
juiced -d &
# emacs --daemon &
dunst > /dev/null 2>&1 &
# offlineimap &
ctmp &

while true; do
    dwm >/dev/null 2>&1
done
