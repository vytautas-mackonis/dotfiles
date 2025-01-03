#!/usr/bin/env bash

if test ! $(which brew); then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

formulas=(
    # flags should pass through the the `brew list check`
    vim
    # diff-so-fancy
    fzf
    git
    reattach-to-user-namespace
    tmux
    tree
    wget
    tidy-html5
    cmake
    openssl
    the_silver_searcher
    scala
    sbt
    node
)

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done
