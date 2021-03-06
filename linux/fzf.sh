#!/usr/bin/env bash
echo "Installing/updating FZF"
FZFDIR=~/.fzf
if [ -d "$FZFDIR" ]; then
    pushd $FZFDIR
    git pull
    popd
else
    git clone --depth 1 https://github.com/junegunn/fzf.git $FZFDIR
fi

"$FZFDIR/install" --all
