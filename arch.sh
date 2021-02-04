#!/bin/sh

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Installing yay"
mkdir -p $HOME/src
cd $HOME/src/
sudo pacman -S --noconfirm git fakeroot base-devel
if [ ! -d "yay" ]; then
  git clone https://aur.archlinux.org/yay.git
fi
cd yay/
makepkg -si --noconfirm

echo "Installing dotfiles..."
cd $HOME/src/
if [ ! -d "dotfiles" ]; then
  git clone https://github.com/oligot/dotfiles.git
fi
cd dotfiles/
./bootstrap.sh 

echo "Installing additional softwares..."
yay -S --noconfirm firefox evolution i3-wm gvim zsh tmux tig thefuck exa bat xorg-xrandr jq ripgrep dunst polybar redshift rofi git-delta-bin git-extras
