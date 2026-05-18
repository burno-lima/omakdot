#!/bin/bash

curl -fsSL https://opencode.ai/install | bash

mkdir -p ~/.config/fish/conf.d
echo 'fish_add_path $HOME/.opencode/bin' > ~/.config/fish/conf.d/opencode.fish
