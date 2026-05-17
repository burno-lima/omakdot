#!/bin/bash

sudo dnf install -y alacritty

mkdir -p ~/.config/alacritty
cp $OMAKDOT_PATH/configs/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
cp $OMAKDOT_PATH/configs/alacritty/theme.toml ~/.config/alacritty/theme.toml

if command -v gsettings &>/dev/null; then
    gsettings set org.gnome.desktop.default-applications.terminal exec alacritty
    gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''
fi
