# Setup fzf
# ---------
if [[ ! "$PATH" == */home/matthew/.fzf/bin* ]]; then
  export PATH="$PATH:/home/matthew/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/matthew/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/matthew/.fzf/shell/key-bindings.zsh"

# Source colorscheme
source "/home/matthew/.fzf/shell/colorscheme.zsh"

# Source custom functions 
source "/home/matthew/.fzf/shell/funct.zsh"

