#!/bin/bash

sudo apt update -y && sudo apt install -y curl
sudo install -dm 755 /etc/apt/keyrings
curl -fSs https://mise.jdx.dev/gpg-key.pub | sudo tee /etc/apt/keyrings/mise-archive-keyring.asc 1> /dev/null
echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.asc] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list

sudo apt update -y
sudo apt install -y mise

mkdir -p ~/.config/mise
cp $OMAKDOT_PATH/configs/mise/config.toml ~/.config/mise/config.toml

mise install

mkdir -p ~/.config/fish/conf.d
echo 'mise activate fish | source' > ~/.config/fish/conf.d/mise.fish
