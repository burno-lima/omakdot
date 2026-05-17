#!/bin/bash

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "Error: Cannot detect OS."
    exit 1
fi

echo "OS detected: $OS"

case "$OS" in
    ubuntu)
        sudo apt update -y
        sudo apt upgrade -y
        sudo apt install -y curl git build-essential
        ;;
    fedora)
        sudo dnf update -y
        sudo dnf install -y curl git gcc gcc-c++ make
        ;;
    *)
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac

for installer in $OMAKDOT_PATH/install/terminal/common/*.sh; do
    [ -f "$installer" ] && source "$installer"
done

for installer in $OMAKDOT_PATH/install/terminal/$OS/*.sh; do
    [ -f "$installer" ] && source "$installer"
done
