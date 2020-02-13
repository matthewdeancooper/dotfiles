 # feh --bg-tile ~/media/scrot/Oct05::193718.png
#------------------------------
# PATH
#------------------------------
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/proj/bin" ] ; then
    PATH="$HOME/proj/bin:$PATH"
fi

# set PATH so it includes .local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#------------------------------
# User configuration
#------------------------------
# Set backlight
lux -S 30%

#------------------------------
# Variables
#------------------------------

# export TERM="xterm-256color"
# export EDITOR="nvim"
# export BROWSER="chromium"
# export READER="zathura"
# export FILE="ranger"

export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode
export READER="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode
emacs --daemon &

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
dunst > /dev/null 2>&1 &
ctmp &

while true; do
    dwm >/dev/null 2>&1
done
