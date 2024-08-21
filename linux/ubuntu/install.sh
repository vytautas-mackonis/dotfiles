#!/usr/bin/env bash
APT_GET_CMD=$(which apt-get)
set -e

echo "Installing FZF"
./fzf.sh > /dev/null

if [ "$OS_NAME" = "Ubuntu" ]; then
    echo "Installing Python"
    ./python-ubuntu.sh > /dev/null
    echo "Installing Node"
    ./node-ubuntu.sh > /dev/null
    echo "Installing Yarn"
    ./yarn-ubuntu.sh > /dev/null
fi

APT_PACKAGES=(
    build-essential
    make
    cmake
    unzip
    tmux
    tree
    wget
    tidy
    xclip
    numlockx
    silversearcher-ag
    jq
    dc
    compizconfig-settings-manager
    compiz-plugins-extra
        )

if [[ ! -z $APT_GET_CMD ]]; then
    echo "Installing APT packages"
    apt-get update > /dev/null
    apt-get install -y "${APT_PACKAGES[@]}" -qq > /dev/null
else
    echo "Error: unknown package system - cannot install packages"
    exit 1;
fi

#stuff for ubuntu
echo "Setting up ubuntu settings"
./settings-ubuntu.sh > /dev/null
