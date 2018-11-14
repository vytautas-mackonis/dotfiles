#!/usr/bin/env bash
(
    set -e
    cd /tmp
    curl -s -O https://www.wfonts.com/download/data/2014/12/06/consolas/consolas.zip > /dev/null
    unzip -o consolas.zip -d /usr/share/fonts/ > /dev/null
    fc-cache -fv > /dev/null
)
