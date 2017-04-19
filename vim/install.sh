#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

mkdir -p ~/.vim
mkdir -p ~/.vim/swapfiles

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ln -s $DOTFILES/vim/vimrc $HOME/.vim/vimrc
fi
vim +PlugInstall +qall

#omnisharp compilation
#pushd ~/.vim/bundle/omnisharp-vim/server
#xbuild
#popd
