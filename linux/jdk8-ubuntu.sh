#!/usr/bin/env bash
set -e
if java -version &> /dev/null; then
	echo "Java already installed"
else
	apt-get install -y python-software-properties debconf-utils -qq > /dev/null
	add-apt-repository -y ppa:webupd8team/java
	apt-get update -qq > /dev/null
	echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
	apt-get install -y oracle-java8-installer -qq > /dev/null
fi
