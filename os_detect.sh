OS="$(uname)"
if [ "$OS" == "Darwin"  ]; then
    export OS_FLAVOUR="osx"
elif [ "$OS" == "Linux" ]; then
    export OS_FLAVOUR="linux"
    export OS_NAME="$(. /etc/os-release; echo $NAME)"
    if grep -q Microsoft /proc/version; then
        export UBUNTU_WINDOWS=1
    else
        export UBUNTU_WINDOWS=0
    fi
else
    export OS_FLAVOUR="unsupported"
fi
