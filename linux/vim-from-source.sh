#!/usr/bin/env bash
set -e
ACTUAL_VERSION=$(vim --version | head -1 | cut -d ' ' -f 5)
MIN_VERSION="8.0"


if ! echo "$ACTUAL_VERSION $MIN_VERSION -p" | dc | grep > /dev/null ^-; then
    echo "Vim already >=$MIN_VERSION. Skipping."
else
    apt install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
        python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git \
        checkinstall

    apt remove vim vim-runtime gvim -y

    (
        cd ~
         git clone https://github.com/vim/vim.git
        cd vim
        ./configure --with-features=huge \
                    --enable-multibyte \
                    --enable-rubyinterp=yes \
                    --enable-python3interp=yes \
                    --with-python3-config-dir=/usr/lib/python3.5/config \
                    --enable-perlinterp=yes \
                    --enable-luainterp=yes \
                    --enable-cscope \
                    --prefix=/usr/local
        make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
        checkinstall -y
    )

    update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
    update-alternatives --set editor /usr/bin/vim
    update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
    update-alternatives --set vi /usr/bin/vim
fi
