#!/usr/bin/env bash

set -e
DOTFILES=$HOME/.dotfiles

mkdir -p ~/.vim
mkdir -p ~/.vim/swapfiles

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ln -s $DOTFILES/vim/vimrc $HOME/.vim/vimrc
fi
vim +PlugInstall +qall
CALLER=$(who -m | awk '{print $1;}')
echo $CALLER
chown -R $CALLER ~/.vim
PIP_BREAK_SYSTEM_PACKAGES=1 pip3 install pynvim
