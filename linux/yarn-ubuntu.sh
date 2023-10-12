#!/usr/bin/env bash
set -e
if yarn --version &> /dev/null; then
	echo "Yarn already installed"
else
    npm install --global yarn
fi
