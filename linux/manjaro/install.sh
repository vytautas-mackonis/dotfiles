set -e

PACKAGES=(
    base-devel
    jq
    nodejs
    npm
    the_silver_searcher
    tmux
    tree
    vim
    xclip
    yarn
)
pacman -Syuq --noconfirm
pacman -Sq "${PACKAGES[@]}" --noconfirm --needed
