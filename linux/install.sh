#!/usr/bin/env bash
APT_GET_CMD=$(which apt-get)

source fzf.sh

APT_PACKAGES=(
    make
    automake
    cmake
    build-essential
    curl
    python-dev
    python3-dev
    python3-venv
    python3-pip
    libtool
    tmux
    tree
    wget
    tidy
    xclip
    numlockx
    silversearcher-ag
    jq
    dc
        )

NPM_PACKAGES=(
    diff-so-fancy
    node-gyp
    typescript
        )

if [[ ! -z $APT_GET_CMD ]]; then
    sudo apt-get update
    sudo apt-get install -y "${APT_PACKAGES[@]}"
    #node repository
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt-get install nodejs
else
    echo "Error: unknown package system - cannot install packages"
    exit 1;
fi

for package in "${NPM_PACKAGES[@]}"; do
    sudo npm install -g $package -y
done

if [ "$OS_NAME" = "Ubuntu" ]; then
    #stuff for ubuntu
    source ../fonts/consolas-ubuntu.sh
    source settings-ubuntu.sh
    source docker-ubuntu.sh
    source mono-ubuntu.sh
    source dotnet-ubuntu.sh
    sudo ./jdk8-ubuntu.sh
    sudo ./sbt-ubuntu.sh
    sudo ./docker-compose-ubuntu.sh
    sudo ./scalastyle-linux.sh

    if [ $UBUNTU_WINDOWS -eq 1 ]; then
        sudo ./vim-from-source.sh
    else
        sudo ./vim-install.sh
    fi
fi
