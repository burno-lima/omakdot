#!/bin/bash

sudo dnf install -y btop

mkdir -p ~/.config/btop
cp $OMAKDOT_PATH/configs/btop/btop.conf ~/.config/btop/btop.conf
