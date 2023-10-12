#!/usr/bin/env bash
set -e
export PYTHON_VERSION=3.11
apt-get update
apt install build-essential checkinstall \ 
    libreadline-gplv2-dev  libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev 

add-apt-repository ppa:deadsnakes/ppa

apt-get update
apt install "python$PYTHON_VERSION-dev" "python$PYTHON_VERSION-venv" "python$PYTHON_VERSION-pip"

