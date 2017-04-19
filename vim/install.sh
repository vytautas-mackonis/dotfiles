#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

mkdir -p ~/.vim
mkdir -p ~/.vim/swapfiles

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim +PlugInstall +qall

#vimproc plugin needs to be compiled after installation
#pushd ~/.vim/bundle/vimproc.vim
#make
#popd

#omnisharp compilation
#pushd ~/.vim/bundle/omnisharp-vim/server
#xbuild
#popd

#pushd ~/.vim/bundle/omnisharp-vim/omnisharp-roslyn
#git checkout dev
#./build.sh
#popd
