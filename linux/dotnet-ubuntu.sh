#!/usr/bin/env bash
set -e
UBUNTU_RELEASE=$(lsb_release -c -s)
wget -q https://packages.microsoft.com/config/ubuntu/$OS_VERSION_ID/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb > /dev/null
apt-get install apt-transport-https -qq > /dev/null
apt-get update -qq > /dev/null
apt-get install dotnet-sdk-2.1 -qq > /dev/null
