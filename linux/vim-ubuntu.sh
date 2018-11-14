#!/usr/bin/env bash
set -e

if (($OS_MAJOR_VERSION < 18)); then
    add-apt-repository ppa:jonathonf/vim -y
fi
apt install vim -y
