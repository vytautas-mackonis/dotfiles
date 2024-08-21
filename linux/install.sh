#!/usr/bin/env bash
set -e

echo "Installing FZF"
./fzf.sh > /dev/null

echo "Setting up fonts"
../fonts/consolas-linux.sh > /dev/null

if [ "$OS_NAME" = "Ubuntu" ]; then
    (
        set -e
        pushd ubuntu
        ./install.sh
        popd
    )
elif [ "$OS_NAME" = "Manjaro Linux" ]; then
    (
        set -e
        pushd manjaro
        ./install.sh
        popd
    )
else
  echo "Unsupported Linux distribution $OS_NAME"
fi
