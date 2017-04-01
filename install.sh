#!/usr/bin/env bash
echo "Installing dotfiles."

INSTALL_DIR="$(dirname "$BASH_SOURCE")"
source utils/link.sh

OS="$(uname)"

# only perform macOS-specific install
if [ "$OS" == "Darwin"  ]; then
    echo -e "\n\nRunning on OSX"
    pushd osx
    source install.sh
    popd
    source fonts/consolas.sh
fi

if [ "$OS" == "Linux" ]; then
    echo -e "\n\nRunning on Linux"
    pushd linux
    source install.sh
    popd
fi

pushd vim
source install.sh
popd
