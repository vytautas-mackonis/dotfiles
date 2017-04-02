#!/usr/bin/env bash
sudo apt-get install cabextract -y
mkdir -p temp
pushd temp
curl -O http://download.microsoft.com/download/f/5/a/f5a3df76-d856-4a61-a6bd-722f52a5be26/PowerPointViewer.exe
cabextract PowerPointViewer.exe
cabextract ppviewer.cab
sudo cp CONSOLA*.TTF /usr/share/fonts/
sudo fc-cache -fv
popd
rm -Rf temp
