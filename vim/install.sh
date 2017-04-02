#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

mkdir -p ~/.vim
mkdir -p ~/.vim/swapfiles

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    ln -s $DOTFILES/vim/vimrc $HOME/.vim/vimrc
fi
vim +PluginInstall +qall
