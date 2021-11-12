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

# zplug
if [ ! -d "$HOME/.zplug" ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# Starship
if ! starship --version > /dev/null; then
  curl -fsSL https://starship.rs/install.sh | sudo bash
fi
ln -sf $pwd/starship/starship.toml ~/.config

# Vim
mkdir -p $HOME/.vim/undo
mkdir -p $HOME/.vim/swp
mkdir -p $HOME/.vim/backup

# Neovim
mkdir -p ~/.config/nvim
ln -sf $pwd/nvim/init.vim ~/.config/nvim/init.vim

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
