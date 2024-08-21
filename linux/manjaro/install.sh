set -e

PACKAGES=(
    base-devel
    cmake
    docker
    docker-buildx
    dotnet-sdk
    jq
    mono
    msbuild
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

# enable and start docker
systemctl start docker.service
systemctl enable docker.service
CALLER=$(who -m | awk '{print $1;}')
usermod -aG docker $CALLER
