#!/usr/bin/env bash
set -e
echo "deb https://dl.bintray.com/sbt/debian /" /etc/apt/sources.list.d/sbt.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
apt-get update -qq > /dev/null
apt-get install -y sbt -qq > /dev/null
