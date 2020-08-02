# Path to your oh-my-zsh installation.
export ZSH="/home/matthew/.oh-my-zsh"

#------------------------------
# OPTIONS
#------------------------------

ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# Dont need to write cd just dir name
setopt  autocd autopushd 

#------------------------------
# PLUGINS
#------------------------------
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode fzf pip cp git zsh-completions zsh-autosuggestions zsh-syntax-highlighting history-substring-search)

# Reload completions for zsh-completions 
autoload -U compinit && compinit


#------------------------------
# SOURCE
#------------------------------
source $ZSH/oh-my-zsh.sh

#
#------------------------------
# ALIASES
#------------------------------
alias v="nvim"
alias zrc="nvim ~/.zshrc"
alias vrc="nvim ~/.config/nvim/init.vim"
alias smci="sudo make clean install"
alias smi="sudo make install"
alias sai="sudo apt install"
alias as="apt search"
alias dotfiles="cd ~/Documents/dotfiles"
alias bin="cd ~/Documents/bin"
alias Documents="cd ~/Documents"
# Use vim as editor
alias editor=vim
alias gs="git status"
alias gp="git push"
alias ga="git add -A"

#------------------------------
# FUNCTIONS
#------------------------------
# Change cursor shape for vi mode
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] || [[ $KEYMAP = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
# Start with beam shape cursor on zsh startup and after every command.
zle-line-init() { zle-keymap-select 'beam'}


#------------------------------
# Keybindings
#------------------------------
bindkey '^o' autosuggest-accept
# Vi mode
bindkey -v


#------------------------------
# Exports and evals
#------------------------------
export FZF_COMPLETION_TRIGGER='**'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=30'
export FZF_DEFAULT_OPTS="--color=16 --layout=reverse --preview '(pdftotext {} - || cat {} || tree -C {}) 2> /dev/null | head -200'"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export VISUAL=vim
export EDITOR="$VISUAL"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


#------------------------------
# DIR SWITCHING
#------------------------------
d='dirs -v | head -10'
# 1='cd -'
# 2='cd -2'
# 3='cd -3'
# 4='cd -4'
# 5='cd -5'
# 6='cd -6'
# 7='cd -7'
# 8='cd -8'
# 9='cd -9'


#------------------------------
# TMUX
#------------------------------
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
