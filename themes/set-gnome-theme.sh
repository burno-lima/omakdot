#!/bin/bash

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

if [ -d "/usr/share/themes/Yaru-$OMAKDOT_THEME_COLOR-dark" ]; then
  gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
  gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$OMAKDOT_THEME_COLOR-dark"
  gsettings set org.gnome.desktop.interface icon-theme "Yaru-$OMAKDOT_THEME_COLOR"
else
  gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
  gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
  gsettings set org.gnome.desktop.interface icon-theme "Adwaita"
fi

gsettings set org.gnome.desktop.interface accent-color "$OMAKDOT_THEME_COLOR" 2>/dev/null || true

BACKGROUND_ORG_PATH="$HOME/.local/share/omakdot/themes/$OMAKDOT_THEME_BACKGROUND"
BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"
BACKGROUND_DEST_PATH="$BACKGROUND_DEST_DIR/$(echo $OMAKDOT_THEME_BACKGROUND | tr '/' '-')"

if [ ! -d "$BACKGROUND_DEST_DIR" ]; then mkdir -p "$BACKGROUND_DEST_DIR"; fi

[ ! -f $BACKGROUND_DEST_PATH ] && cp $BACKGROUND_ORG_PATH $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri-dark $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-options 'zoom'
