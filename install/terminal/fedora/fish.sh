#!/bin/bash

sudo dnf install -y fish
chsh -s "$(command -v fish)"

fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher'
fish -c 'fisher install pure-fish/pure'

mkdir -p ~/.config/fish
cp $OMAKDOT_PATH/configs/fish/config.fish ~/.config/fish/config.fish
