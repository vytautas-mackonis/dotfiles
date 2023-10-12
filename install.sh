#!/usr/bin/env bash
set -e
echo "Installing dotfiles."
source ./os_detect.sh

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

# only perform macOS-specific install
if [ "$OS_FLAVOUR" == "osx"  ]; then
    echo -e "\n\nRunning on OSX"
    pushd osx
    source install.sh
    popd
fi

if [ "$OS_FLAVOUR" == "linux" ]; then
    echo -e "\n\nRunning on Linux"
    (
        set -e
	pushd linux
        ./install.sh
	popd
    )
fi

(
    set -e
    cd vim
    ./install.sh
)

#installing terminal descriptors
# tic -x ~/.dotfiles/resources/tmux-256color-italic.terminfo
# tic -x ~/.dotfiles/resources/xterm-256color-italic.terminfo

#turning on diff-so-fancy for all git diff commands
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.keepBackup false
git config --global mergetool.prompt false
git config --global push.default simple

# removing that annoying sound on tab completion failure etc
if [ -f ~/.inputrc ]; then
    grep -q -F 'set bell-style none' ~/.inputrc || echo 'set bell-style none' >> ~/.inputrc
else
    echo 'set bell-style none' >> ~/.inputrc
fi

