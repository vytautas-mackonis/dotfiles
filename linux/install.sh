#!/usr/bin/env bash
YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)

source fzf.sh

APT_PACKAGES=(
    gcc-c++
    make
    automake
    libtool
    vim
    nodejs
    tmux
    tree
    wget
    tidy
        )

YUM_PACKAGES=(
    gcc-c++
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
        )

if [[ ! -z $YUM_CMD ]]; then
    #node repository
    curl --silent --location https://rpm.nodesource.com/setup_7.x | bash -

    sudo yum update

    for package in "${YUM_PACKAGES[@]}"; do
        sudo yum install $package -y
    done
elif [[ ! -z $APT_GET_CMD ]]; then
    #node repository
    curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

    sudo apt-get update

    sudo apt-get install -y "${APT_PACKAGES[@]}"
else
    echo "Error: unknown package system - cannot install packages"
    exit 1;
fi

for package in "${NPM_PACKAGES[@]}"; do
    sudo npm install -g $package -y
done

#turning on diff-so-fancy for all git diff commands
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

if [ "$(. /etc/os-release; echo $NAME)" = "Ubuntu" ]; then
    #stuff for ubuntu
    source docker-ubuntu.sh
fi
