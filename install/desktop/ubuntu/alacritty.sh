#!/bin/bash

sudo apt install -y alacritty

mkdir -p ~/.config/alacritty
cp $OMAKDOT_PATH/configs/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
cp $OMAKDOT_PATH/configs/alacritty/theme.toml ~/.config/alacritty/theme.toml

sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty
