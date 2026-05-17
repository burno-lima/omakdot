#!/bin/bash

sudo apt install -y rclone

mkdir -p ~/.local/bin
cp $OMAKDOT_PATH/bin/backup-gdrive.sh ~/.local/bin/backup-gdrive.sh
chmod +x ~/.local/bin/backup-gdrive.sh
