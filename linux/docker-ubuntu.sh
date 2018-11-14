#!/usr/bin/env bash
set -e

apt-get update -qq > /dev/null
apt-get remove docker docker-engine -y -qq > /dev/null
apt-get update -qq > /dev/null
if (($OS_MAJOR_VERSION < 18)); then
    apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual -qq > /dev/null
fi
apt-get install -y apt-transport-https ca-certificates curl software-properties-common -qq > /dev/null
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update -qq > /dev/null
apt-get install -y docker-ce -qq > /dev/null
usermod -aG docker $(whoami)
