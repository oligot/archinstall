#!/usr/bin/env bash

# https://sharats.me/posts/shell-script-best-practices/
set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then set -o xtrace; fi

pwd=$(pwd)

update_system() {
	echo "Updating system..."
	sudo pacman -Syu --noconfirm
}

install_yay() {
	echo "Installing yay..."
	mkdir -p "$HOME/src"
	cd "$HOME/src" || exit
	sudo pacman -S --noconfirm git fakeroot base-devel
	if [[ ! -d "yay" ]]; then
		git clone https://aur.archlinux.org/yay.git
	fi
	cd yay/ || exit
	makepkg -si --noconfirm
	cd "$pwd" || exit
}

install_dotfiles() {
  echo "Installing dotfiles..."
  sudo pacman -S --noconfirm chezmoi
  chezmoi init --apply https://github.com/oligot/dotfiles.git
}

install_tpm() {
	echo "Installing Tmux Plugin Manager..."
	if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
		git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
	fi
}

install_node() {
	echo "Installing Node.js..."
	if [[ ! -d "$HOME/n" ]]; then
		curl -L https://bit.ly/n-install | bash
	fi
}

install_soft() {
	echo "Installing additional softwares..."
	local packages
	sudo pacman -S --noconfirm $(cat packages.txt | tr -d '\n')
}

install_zplug() {
	echo "Installing Zplug..."
	if [[ ! -d "$HOME/.zplug" ]]; then
		curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
	fi
}

update_system
install_yay
install_dotfiles
install_tpm
install_node
install_soft
install_zplug
