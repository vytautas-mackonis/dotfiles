#!/usr/bin/env bash
UBUNTU_RELEASE=$(lsb_release -c -s)
sudo sh -c "echo \"deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ $UBUNTU_RELEASE main\" > /etc/apt/sources.list.d/dotnetdev.list"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
sudo apt-get update

sudo apt-get install -y dotnet-dev-1.0.1
