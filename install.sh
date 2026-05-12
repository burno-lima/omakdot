#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

trap 'echo "OmakGnome installation failed! You can retry by running: bash ~/.local/share/omakgnome/install.sh"' ERR

export OMAKGNOME_PATH="$HOME/.local/share/omakgnome"

# Make apply-theme script executable
chmod +x "$OMAKGNOME_PATH/bin/apply-theme.sh"

# Install GNOME Shell extension for Quick Settings theme button
EXTENSION_UUID="omakgnome-theme@omakgnome"
EXTENSION_DIR="$HOME/.local/share/gnome-shell/extensions/$EXTENSION_UUID"

echo "Installing GNOME Shell extension..."
mkdir -p "$EXTENSION_DIR"
cp "$OMAKGNOME_PATH/extensions/$EXTENSION_UUID/metadata.json" "$EXTENSION_DIR/"
cp "$OMAKGNOME_PATH/extensions/$EXTENSION_UUID/extension.js" "$EXTENSION_DIR/"
cp "$OMAKGNOME_PATH/extensions/$EXTENSION_UUID/stylesheet.css" "$EXTENSION_DIR/"

# Enable the extension
if command -v gnome-extensions &>/dev/null; then
  gnome-extensions enable "$EXTENSION_UUID" 2>/dev/null || true
fi

echo ""
echo "OmakGnome installed!"
echo "Use the 'Theme' button in GNOME Quick Settings (top-right panel) to switch themes."
echo ""
echo "You may need to log out and back in for the button to appear."
