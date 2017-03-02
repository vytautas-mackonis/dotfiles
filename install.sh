echo "Installing dotfiles."

INSTALL_DIR="$(dirname "$BASH_SOURCE")"
source utils/link.sh

# only perform macOS-specific install
if [ "$(uname)" == "Darwin"  ]; then
    echo -e "\n\nRunning on OSX"
    pushd osx
    source install.sh
    source fonts/consolas.sh
    popd
fi
