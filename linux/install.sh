#!/usr/bin/env bash
YUM_CMD=$(which yum)
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
        )

YUM_PACKAGES=(
    make
    automake
    libtool
    vim
    nodejs
    epel-release
    tmux
    tree
    wget
        )

NPM_PACKAGES=(
    diff-so-fancy
    node-gyp
    typescript
        )

if [[ ! -z $YUM_CMD ]]; then
    #node repository
    curl --silent --location https://rpm.nodesource.com/setup_7.x | bash -

    sudo yum update

    for package in "${YUM_PACKAGES[@]}"; do
        sudo yum install $package -y
    done
elif [[ ! -z $APT_GET_CMD ]]; then
    sudo apt-get update
    sudo apt-get install -y "${APT_PACKAGES[@]}"
    #node repository
    curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
    sudo apt-get install nodejs
else
    echo "Error: unknown package system - cannot install packages"
    exit 1;
fi

for package in "${NPM_PACKAGES[@]}"; do
    sudo npm install -g $package -y
done

if [ "$(. /etc/os-release; echo $NAME)" = "Ubuntu" ]; then
    #stuff for ubuntu
    source ../fonts/consolas-ubuntu.sh
    source settings-ubuntu.sh
    source docker-ubuntu.sh
    source mono-ubuntu.sh
    source dotnet-ubuntu.sh
    sudo ./jdk8-ubuntu.sh
    sudo ./sbt-ubuntu.sh
    sudo ./vim-install.sh
    sudo ./docker-compose-ubuntu.sh
    sudo ./scalastyle-linux.sh

    sudo update-alternatives --set vim /usr/bin/vim.nox-py2
fi
