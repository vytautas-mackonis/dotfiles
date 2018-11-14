#!/usr/bin/env bash
APT_GET_CMD=$(which apt-get)
set -e

echo "Installing FZF"
./fzf.sh > /dev/null

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
    echo "Installing APT packages"
    apt-get update > /dev/null
    apt-get install -y "${APT_PACKAGES[@]}" -qq > /dev/null
    #node repository
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - > /dev/null
    apt-get install nodejs -qq > /dev/null
else
    echo "Error: unknown package system - cannot install packages"
    exit 1;
fi

echo "Installing NPM packages"
for package in "${NPM_PACKAGES[@]}"; do
    npm install -g $package -y > /dev/null
done

if [ "$OS_NAME" = "Ubuntu" ]; then
    #stuff for ubuntu
    echo "Setting up fonts"
    ../fonts/consolas-ubuntu.sh > /dev/null
    echo "Setting up ubuntu settings"
    ./settings-ubuntu.sh > /dev/null
    echo "Installing docker"
    ./docker-ubuntu.sh > /dev/null
    echo "Installing docker-compose"
    ./docker-compose-ubuntu.sh > /dev/null
    echo "Installing mono"
    ./mono-ubuntu.sh > /dev/null
    echo "Installing dotnet"
    ./dotnet-ubuntu.sh > /dev/null
    echo "Installing JDK"
    ./jdk8-ubuntu.sh > /dev/null
    echo "Installing SBT"
    ./sbt-ubuntu.sh > /dev/null
    echo "Installing scalastyle"
    ./scalastyle-linux.sh > /dev/null
    echo "Installing yarn"
    ./yarn-ubuntu.sh > /dev/null

    echo "Installing vim"
    if [ $UBUNTU_WINDOWS -eq 1 ]; then
        ./vim-from-source.sh > /dev/null
    else
        ./vim-ubuntu.sh > /dev/null
    fi
fi
