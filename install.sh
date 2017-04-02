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

#installing terminal descriptors
tic -x ~/.dotfiles/resources/tmux-256color-italic.terminfo
tic -x ~/.dotfiles/resources/xterm-256color-italic.terminfo

#turning on diff-so-fancy for all git diff commands
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
