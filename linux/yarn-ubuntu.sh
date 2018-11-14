#!/usr/bin/env bash
set -e
if yarn --version &> /dev/null; then
	echo "Yarn already installed"
else
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
    apt-get update -qq > /dev/null
    apt-get install yarn -qq > /dev/null
fi
