#!/bin/bash

set -e

trap 'echo "OmakDot installation failed! You can retry by running: bash ~/.local/share/omakdot/install.sh"' ERR

export OMAKDOT_PATH="$HOME/.local/share/omakdot"

# Step 1: Install terminal packages
echo "Installing terminal tools..."
source "$OMAKDOT_PATH/install/terminal.sh"

# Step 2: Install desktop packages (only on GNOME)
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
    echo "Installing desktop tools..."
    source "$OMAKDOT_PATH/install/desktop.sh"
fi

# Make apply-theme script executable
chmod +x "$OMAKDOT_PATH/bin/apply-theme.sh"

# Setup Chrome/Chromium policy directories and passwordless sudo for theme color
sudo mkdir -p /etc/opt/chrome/policies/managed /etc/chromium/policies/managed
SUDOERS_FILE="/etc/sudoers.d/omakdot-browser-theme"
echo "$USER ALL=(ALL) NOPASSWD: /usr/bin/tee /etc/opt/chrome/policies/managed/color.json, /usr/bin/tee /etc/chromium/policies/managed/color.json, /usr/bin/mkdir -p /etc/opt/chrome/policies/managed, /usr/bin/mkdir -p /etc/chromium/policies/managed" | sudo tee "$SUDOERS_FILE" >/dev/null
sudo chmod 0440 "$SUDOERS_FILE"

# Install GNOME Shell extension for Quick Settings theme button
EXTENSION_UUID="omakdot-theme@omakdot"
EXTENSION_DIR="$HOME/.local/share/gnome-shell/extensions/$EXTENSION_UUID"

echo "Installing GNOME Shell extension..."
mkdir -p "$EXTENSION_DIR"
cp "$OMAKDOT_PATH/extensions/$EXTENSION_UUID/metadata.json" "$EXTENSION_DIR/"
cp "$OMAKDOT_PATH/extensions/$EXTENSION_UUID/extension.js" "$EXTENSION_DIR/"
cp "$OMAKDOT_PATH/extensions/$EXTENSION_UUID/stylesheet.css" "$EXTENSION_DIR/"

# Enable the extension (via gsettings to persist even before first login)
CURRENT_EXTENSIONS=$(gsettings get org.gnome.shell enabled-extensions)
if [[ "$CURRENT_EXTENSIONS" != *"$EXTENSION_UUID"* ]]; then
  if [[ "$CURRENT_EXTENSIONS" == "@as []" ]]; then
    gsettings set org.gnome.shell enabled-extensions "['$EXTENSION_UUID']"
  else
    gsettings set org.gnome.shell enabled-extensions "$(echo "$CURRENT_EXTENSIONS" | sed "s/]/, '$EXTENSION_UUID']/")"
  fi
fi
gnome-extensions enable "$EXTENSION_UUID" 2>/dev/null || true

echo ""
echo "OmakDot installed!"
echo "Use the 'Theme' button in GNOME Quick Settings (top-right panel) to switch themes."
echo ""
echo "You may need to log out and back in for the button to appear."
