#!/bin/sh

pwd=`pwd`

# Dotfiles
for i in `ls -A src`; do
    target="$pwd/src/$i"
    name="$HOME/$i"
    echo "Linking $target to $name"
    ln -sf $target $HOME
done

# bin
mkdir -p $HOME/bin
for i in `ls -A bin`; do
    target="$pwd/bin/$i"
    name="$HOME/bin/$i"
    echo "Linking $target to $name"
    ln -sf $target $HOME/bin/$i
done

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi

# Vim
mkdir -p $HOME/.vim/undo
mkdir -p $HOME/.vim/swp
mkdir -p $HOME/.vim/backup

# Tmux
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

# i3
ln -sf $pwd/i3 ~/.config

# polybar
ln -sf $pwd/polybar ~/.config

# Redshift
mkdir -p ~/.config/redshift
ln -sf $pwd/redshift/redshift.conf ~/.config/redshift/
mkdir -p ~/.config/systemd/user/
ln -sf $pwd/redshift/redshift.service ~/.config/systemd/user/

# Dunst
ln -sf $pwd/dunst ~/.config
