#!/usr/bin/env bash
set -e
cp ../fonts/CONSOLA*.ttf /usr/share/fonts/
fc-cache -fv > /dev/null
