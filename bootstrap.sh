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
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi
if [ ! -d "${ZSH_CUSTOM}/plugins/you-should-use" ]; then
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM}/plugins/you-should-use
fi
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-docker-aliases" ]; then
    git clone https://github.com/akarzim/zsh-docker-aliases ${ZSH_CUSTOM}/plugins/zsh-docker-aliases
fi
if [ ! -d "$ZSH_CUSTOM/themes/spaceship-prompt" ]; then
  git clone https://github.com/denysdovhan/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt
fi
ln -sf "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Git
if [ ! -d "$HOME/.git-radar" ]; then
    git clone https://github.com/michaeldfallen/git-radar.git $HOME/.git-radar
fi
if [ ! -d "$HOME/.diff-so-fancy" ]; then
    git clone https://github.com/so-fancy/diff-so-fancy.git $HOME/.diff-so-fancy
    mkdir -p $HOME/bin
    ln -s $HOME/.diff-so-fancy/diff-so-fancy $HOME/bin/diff-so-fancy
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
