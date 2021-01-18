DIR=$PWD
## home
ln -sf $DIR/.profile ~/.profile
ln -sf $DIR/.spacemacs ~/.spacemacs
ln -sf $DIR/.bashrc ~/.bashrc
ln -sf $DIR/.gitconfig ~/.gitconfig
ln -sf $DIR/.selected_editor ~/.selected_editor
ln -sf $DIR/.tmuxconf ~/.tmux.conf

# My extensions in home
ln -sf $DIR/.profile_exports ~/.profile_exports
ln -sf $DIR/.bash_aliases ~/.bash_aliases

## .config
ln -sf $DIR/init.vim ~/.config/nvim/init.vim
ln -sf $DIR/user-dirs.dirs ~/.config/user-dirs.dirs
