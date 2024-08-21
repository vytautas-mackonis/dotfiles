OS="$(uname)"
if [ "$OS" == "Darwin"  ]; then
    export OS_FLAVOUR="osx"
elif [ "$OS" == "Linux" ]; then
    export OS_FLAVOUR="linux"
    export OS_NAME="$(. /etc/os-release; echo $NAME)"
    export OS_VERSION_ID="$(. /etc/os-release; echo $VERSION_ID)"
    export OS_MAJOR_VERSION="$(. /etc/os-release; echo $VERSION_ID | cut -d. -f1)"
    if grep -q Microsoft /proc/version; then
        export UBUNTU_WINDOWS=1
    else
        export UBUNTU_WINDOWS=0
    fi
else
    export OS_FLAVOUR="unsupported"
fi
echo "Detected OS: flavour - $OS_FLAVOUR, name - $OS_NAME, major version - $OS_MAJOR_VERSION" 
