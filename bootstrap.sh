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
for i in `ls -A bin`; do
    target="$pwd/bin/$i"
    name="$HOME/bin/$i"
    echo "Linking $target to $name"
    ln -sf $target $HOME/bin
done

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi
if [ ! -d "${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi
if [ ! -d "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi
if [ ! -d "${HOME}/.oh-my-zsh/custom/plugins/zsh-you-should-use" ]; then
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-you-should-use
fi
rm -f $HOME/.oh-my-zsh/themes/oli.zsh-theme
ln -s $pwd/oli.zsh-theme $HOME/.oh-my-zsh/themes

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
