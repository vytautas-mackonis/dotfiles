#!/usr/bin/env bash
set -e
echo "Installing dotfiles."

INSTALL_DIR="$(dirname "$BASH_SOURCE")"
if [[ -f ~/.profile && (! -h ~/.profile) ]]; then
    echo "Backing up .profile"
    mv ~/.profile ~/.profile_old
fi

if [[ -f ~/.bash_profile && (! -h ~/.bash_profile) ]]; then
    echo "Backing up .bash_profile"
    mv ~/.bash_profile ~/.bash_profile_old
fi

if [[ -f ~/.bashrc && (! -h ~/.bashrc) ]]; then
    echo "Backing up .bashrc"
    mv ~/.bashrc ~/.bashrc_old
fi

source utils/link.sh

OS="$(uname)"

# only perform macOS-specific install
if [ "$OS" == "Darwin"  ]; then
    echo -e "\n\nRunning on OSX"
    pushd osx
    source install.sh
    popd
fi

if [ "$OS" == "Linux" ]; then
    echo -e "\n\nRunning on Linux"
    (
        set -e
        cd linux
        ./install.sh
    )
fi

(
    set -e
    cd vim
    ./install.sh
)

#installing terminal descriptors
tic -x ~/.dotfiles/resources/tmux-256color-italic.terminfo
tic -x ~/.dotfiles/resources/xterm-256color-italic.terminfo

#turning on diff-so-fancy for all git diff commands
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
