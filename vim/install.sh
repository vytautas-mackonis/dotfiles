#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

mkdir -p ~/.vim
mkdir -p ~/.vim/swapfiles
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s $DOTFILES/vim/vimrc $HOME/.vim/vimrc
vim +PluginInstall +qall
