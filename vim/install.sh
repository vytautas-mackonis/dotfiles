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

if [ ! "$UBUNTU_WINDOWS" -eq 1 ]; then
    #"omnisharp compilation
    (
        cd ~/.vim/bundle/omnisharp-vim/omnisharp-roslyn
        #git checkout dev
        ./build.sh --target Quick
        #cp ~/.nuget/packages/runtime.ubuntu.16.04-x64.runtime.native.System/1.0.1/runtimes/ubuntu.16.04-x64/native/System.Native.so artifacts/publish/OmniSharp/default/net46/libSystem.Native.so
        cd artifacts/scripts
        cp ~/.dotfiles/vim/Omnisharp ./
    )
fi

#pushd ~/.vim/bundle/omnisharp-vim/server
#xbuild
#popd
