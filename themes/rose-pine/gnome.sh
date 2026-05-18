#!/bin/bash

OMAKDOT_THEME_COLOR="red"
OMAKDOT_ADWAITA_ACCENT="pink"
OMAKDOT_THEME_BACKGROUND="rose-pine/background.jpg"
source $OMAKDOT_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
