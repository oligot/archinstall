#!/bin/sh

pwd=`pwd`

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Installing yay..."
mkdir -p $HOME/src
cd $HOME/src/
sudo pacman -S --noconfirm git fakeroot base-devel
if [ ! -d "yay" ]; then
  git clone https://aur.archlinux.org/yay.git
fi
cd yay/
makepkg -si --noconfirm

echo "Installing dotfiles..."
sudo pacman -S --noconfirm chezmoi
chezmoi init --apply https://github.com/oligot/dotfiles.git

echo "Create Vim directories..."
mkdir -p $HOME/.vim/undo
mkdir -p $HOME/.vim/swp
mkdir -p $HOME/.vim/backup

echo "Installing Tmux Plugin Manager..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

echo "Installing additional softwares..."
yay -S --noconfirm firefox evolution i3-wm gvim neovim python-pynvim zsh tmux tig thefuck exa bat xorg-xrandr jq ripgrep dunst polybar redshift rofi git-delta git-extras direnv nodejs-lts-gallium ranger

echo "Installing additional bin..."
mkdir -p $HOME/bin
ln -sf $pwd/bin/t $HOME/bin/t

echo "Installing Zplug..."
if [ ! -d "$HOME/.zplug" ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
