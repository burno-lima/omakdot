#!/bin/bash

cd /tmp
OBSIDIAN_VERSION=$(curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | jq -r '.tag_name' | sed 's/^v//')
wget -O obsidian.deb "https://github.com/obsidianmd/obsidian-releases/releases/latest/download/obsidian_${OBSIDIAN_VERSION}_amd64.deb"
sudo apt install -y ./obsidian.deb
rm obsidian.deb
cd -
