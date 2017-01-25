#!/bin/sh

pwd=`pwd`

# Dotfiles
for i in `ls -A src`; do
    basename=`basename $i`
    rm -rf $HOME/$basename
    target="$pwd/src/$i"
    name="$HOME/$i"
    echo "Linking $target to $name"
    ln -s $target $name
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
