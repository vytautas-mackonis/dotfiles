#!/usr/bin/env bash
if dotnet --version &> /dev/null; then
    echo "Dotnet already installed"
else
    echo "Installing dotnet..."
    wget -O dotnet.pkg https://go.microsoft.com/fwlink/?linkid=843444
    sudo installer -store -pkg dotnet.pkg -target /
    rm dotnet.pkg
fi
