#------------------------------
# Base options
#------------------------------
# The following lines were added by compinstall
zstyle :compinstall filename '/home/matthew/.zshrc'

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# No delay between caps for ctrl and esc
KEYTIMEOUT=0

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
setopt PROMPT_SUBST
PROMPT='${PWD/#$HOME/~} '
#
#------------------------------
# alias
#------------------------------
alias v="nvim"
alias vim="nvim"
alias rr="ranger"
alias la="ls -A"
alias smci="sudo make clean install"

alias pku="sudo pacman -Syu" #update
alias pkl="pacman -Qet" #list explicitly installed (no depends)
alias pki="sudo pacman -S" #install a package
alias pko="pacman -Qtd" #show orphaned packaged
alias pka="pacman -Qm" #installed by pacman but not in database (ie. AUR)
alias pkb="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'" # browse installed packages

alias tls="tmux list-sessions"

#------------------------------
# Functions
#------------------------------
# ls on cd
function chpwd() {
    emulate -L zsh
    # ls
	tree -L 1
}


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

# em()
# {
#     args=""
#     nw=false
#     # check if emacsclient is already running
#     if pgrep -U $(id -u) emacsclient > /dev/null; then running=true; fi

#     # check if the user wants TUI mode
#     for arg in "$@"; do
#     	if [ "$arg" = "-nw" ] || [ "$arg" = "-t" ] || [ "$arg" = "--tty" ]
# 	then
#     	    nw=true
#     	fi
#     done

#     # if called without arguments - open a new gui instance
#     if [ "$#" -eq "0" ] || [ "$running" != true ]; then
# 	args=(-c $args) 		# open emacsclient in a new window
#     fi
#     if [ "$#" -gt "0" ]; then
# 	# if 'em -' open standard input (e.g. pipe)
# 	if [[ "$1" == "-" ]]; then
#     	    TMP="$(mktemp /tmp/emacsstdin-XXX)"
#     	    cat >$TMP
# 	    args=($args --eval '(let ((b (generate-new-buffer "*stdin*"))) (switch-to-buffer b) (insert-file-contents "'${TMP}'") (delete-file "'${TMP}'"))')
# 	else
# 	    args=($@ $args)
# 	fi
#     fi

#     # emacsclient $args
#     if $nw; then
# 	emacsclient "${args[@]}"
#     else
# 	(nohup emacsclient "${args[@]}" > /dev/null 2>&1 &) > /dev/null
#     fi
# }
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
bindkey '^o' autosuggest-accept

#------------------------------
# Source
#------------------------------
source ~/.fzf
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

#------------------------------
# Exports
#------------------------------
export FZF_COMPLETION_TRIGGER='**'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=30'
export FZF_DEFAULT_OPTS="--color=16 --layout=reverse --preview '(pdftotext {} - || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND="fd . $HOME"

# eval "$(pyenv init -)"
