#!/bin/sh

echo "Updating system..."
sudo pacman -Syu

echo "Installing yay"
mkdir -p $HOME/src
cd $HOME/src/
sudo pacman -S git fakeroot
if [ ! -d "yay" ]; then
  git clone https://aur.archlinux.org/yay.git
fi
cd yay/
makepkg -si

echo "Installing dotfiles..."
cd $HOME/src/
if [ ! -d "dotfiles" ]; then
  git clone https://github.com/oligot/dotfiles.git
fi
cd dotfiles/
./bootstrap.sh 

echo "Installing additional softwares..."
yay -S firefox evolution i3-wm vim zsh tmux tig git-delta-bin
