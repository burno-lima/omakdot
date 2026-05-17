#!/bin/bash

sudo apt install -y libfuse2

cd /tmp

ARCHIVE_URL=$(curl -s 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release' | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}' | sed 's/[", ]//g')

wget -q --show-progress -O jetbrains-toolbox.tar.gz "$ARCHIVE_URL"

mkdir -p ~/.local/share/JetBrains/Toolbox ~/.local/bin

tar -xzf jetbrains-toolbox.tar.gz -C ~/.local/share/JetBrains/Toolbox --strip-components=1

chmod +x ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox

ln -sf ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox ~/.local/bin/jetbrains-toolbox

rm -f jetbrains-toolbox.tar.gz

nohup ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox > /dev/null 2>&1 &

cd -
