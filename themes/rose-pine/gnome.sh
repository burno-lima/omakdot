#!/bin/bash

OMAKGNOME_THEME_COLOR="red"
OMAKGNOME_THEME_BACKGROUND="rose-pine/background.jpg"
source $OMAKGNOME_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
