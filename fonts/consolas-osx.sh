brew install cabextract
(
    set -e
    rm -Rf consolas_temp
    mkdir -p consolas_temp
    cd consolas_temp
    curl -O http://download.microsoft.com/download/f/5/a/f5a3df76-d856-4a61-a6bd-722f52a5be26/PowerPointViewer.exe
    cabextract PowerPointViewer.exe
    cabextract ppviewer.cab
    sudo cp CONSOLA*.TTF ~/Library/Fonts/
    cd ..
    rm -Rf consolas_temp
)
