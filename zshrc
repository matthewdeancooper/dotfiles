#------------------------------
# Base options 
#------------------------------
# The following lines were added by compinstall
zstyle :compinstall filename '/home/matthew/.zshrc'

# bindkey -v
# No delay between caps for ctrl and esc
KEYTIMEOUT=0

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Completion
autoload -Uz compinit
compinit
# Completion menu 
zstyle ':completion:*' menu select
# Completion for sudo commands
zstyle ':completion::complete:*' gain-privileges 1
# Keep completions updated
zstyle ':completion:*' rehash true

# Options
# Use vi mode
# Use command line switches for alias commands
setopt appendhistory autocd extendedglob vi COMPLETE_ALIASES


#------------------------------
# Theming 
#------------------------------
# Prompt
autoload -Uz promptinit
promptinit
prompt suse 
#
#------------------------------
# alias
#------------------------------
alias vim="nvim"
alias mgg="cd ~"
alias dowgg="cd ~/Downloads"
alias docgg="cd ~/Documents"
alias gitgg="cd ~/Git"
alias picgg="cd ~/Pictures"
alias bingg="cd ~/bin"

#------------------------------
# Functions 
#------------------------------
# ls on cd
function chpwd() {
    emulate -L zsh
    ls -a
}

# add sudo to buffer
function add-sudo(){
  LBUFFER="$sudo {LBUFFER}"
}
zle -N add-sudo 



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


# Fzf search dotfiles
function fdot() {
local files
  files=$(fd . ~/Dotfiles | fzf)
  if [[ -n $files ]]
  then
     vim -- $files
  fi
}
zle -N fdot 

# Bookmarks
function mark() {
		bookmark=$(pwd)
		echo $bookmark >> ~/.marks
}

function fmark() {
		bookmark=$(cat ~/.marks | fzf)
		cd "$bookmark" 
}


# Fzf search and open 
fo() {
  local out file key
  IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

#------------------------------
# Some fzf options 
#------------------------------
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

#------------------------------
# Keybindings 
#------------------------------
bindkey '^O' autosuggest-accept
bindkey '^S' add-sudo 

#------------------------------
# Source 
#------------------------------
source ~/.fzf
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf/completion.zsh
# source /usr/share/fzf/key-bindings.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#------------------------------
# Exports 
#------------------------------
export FZF_COMPLETION_TRIGGER='**'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'
export FZF_DEFAULT_OPTS="--color=16 --layout=reverse --preview '(pdftotext {} - || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND="fd . $HOME"
