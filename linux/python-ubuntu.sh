#!/usr/bin/env bash
set -e
export PYTHON_VERSION=3.11
add-apt-repository ppa:deadsnakes/ppa -y
apt-get update
apt install "python$PYTHON_VERSION-dev" "python$PYTHON_VERSION-venv" "python$PYTHON_VERSION-distutils" -y

