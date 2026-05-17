#!/bin/bash

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager addrepo --from-repofile=https://mise.jdx.dev/rpm/mise.repo
sudo dnf install -y mise

mkdir -p ~/.config/mise
cp $OMAKDOT_PATH/configs/mise/config.toml ~/.config/mise/config.toml

mise install

mkdir -p ~/.config/fish/conf.d
echo 'mise activate fish | source' > ~/.config/fish/conf.d/mise.fish
