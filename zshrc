# The following lines were added by compinstall
zstyle :compinstall filename '/home/matthew/.zshrc'

# Completion
autoload -Uz compinit
compinit
# nicer menu
zstyle ':completion:*' menu select
# complete sudo commands
zstyle ':completion::complete:*' gain-privileges 1
# command line switches for alias commands
setopt COMPLETE_ALIASES

# Use vi mode
bindkey -v

# Theme
autoload -Uz promptinit
promptinit
prompt suse 
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
#
# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Options
# setopt appendhistory autocd extendedglob
setopt appendhistory autocd
# End of lines configured by zsh-newuser-install
#
#
# alias
alias vim="nvim"
alias mgg="cd ~"
alias dowgg="cd ~/Downloads"
alias docgg="cd ~/Documents"
alias gitgg="cd ~/Git"
alias picgg="cd ~/Pictures"
# alias fdot="vim ~/Dotfiles/$(ls ~/Dotfiles | fzf)"
# alias fbin="vim ~/bin/$(ls ~/bin | fzf)"

#ls on cd
function chpwd() {
    emulate -L zsh
    ls -a
}

export FZF_COMPLETION_TRIGGER=',,'

# zsh autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=200'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

source ~/.fzf


source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^O' autosuggest-accept
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#?
zstyle ':completion:*' rehash true
