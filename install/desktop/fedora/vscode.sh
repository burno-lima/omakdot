#!/bin/bash

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo tee /etc/yum.repos.d/vscode.repo > /dev/null <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

sudo dnf check-update || true
sudo dnf install -y code

mkdir -p ~/.config/Code/User
cp $OMAKDOT_PATH/configs/vscode.json ~/.config/Code/User/settings.json

code --install-extension anthropic.claude-code
