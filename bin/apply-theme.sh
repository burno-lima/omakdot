#!/bin/bash
# Apply an OmakDot theme by name
# Usage: apply-theme.sh <theme-id>

THEME="$1"
export OMAKDOT_PATH="${OMAKDOT_PATH:-$HOME/.local/share/omakdot}"

if [ -z "$THEME" ] || [ ! -d "$OMAKDOT_PATH/themes/$THEME" ]; then
  echo "Usage: apply-theme.sh <theme-id>"
  echo "Available: tokyo-night catppuccin nord everforest gruvbox kanagawa ristretto rose-pine matte-black solarized-osaka"
  exit 1
fi

# Alacritty
if [ -d "$HOME/.config/alacritty" ]; then
  cp "$OMAKDOT_PATH/themes/$THEME/alacritty.toml" "$HOME/.config/alacritty/theme.toml"

  # Ensure the main alacritty.toml imports theme.toml
  ALACRITTY_CONF="$HOME/.config/alacritty/alacritty.toml"
  if [ -f "$ALACRITTY_CONF" ]; then
    if grep -q '^import' "$ALACRITTY_CONF"; then
      sed -i 's|^import = \[.*\]|import = ["~/.config/alacritty/theme.toml"]|' "$ALACRITTY_CONF"
    else
      sed -i '1i import = ["~/.config/alacritty/theme.toml"]' "$ALACRITTY_CONF"
    fi
  fi
fi

# Zellij
if [ -d "$HOME/.config/zellij" ]; then
  mkdir -p "$HOME/.config/zellij/themes"
  cp "$OMAKDOT_PATH/themes/$THEME/zellij.kdl" "$HOME/.config/zellij/themes/$THEME.kdl"
  if [ -f "$HOME/.config/zellij/config.kdl" ]; then
    sed -i "s/theme \".*\"/theme \"$THEME\"/g" "$HOME/.config/zellij/config.kdl"
  fi
fi

# Neovim
if [ -d "$HOME/.config/nvim" ]; then
  mkdir -p "$HOME/.config/nvim/lua/plugins"
  cp "$OMAKDOT_PATH/themes/$THEME/neovim.lua" "$HOME/.config/nvim/lua/plugins/theme.lua"
fi

# btop
if [ -d "$HOME/.config/btop" ]; then
  mkdir -p "$HOME/.config/btop/themes"
  if [ -f "$OMAKDOT_PATH/themes/$THEME/btop.theme" ]; then
    cp "$OMAKDOT_PATH/themes/$THEME/btop.theme" "$HOME/.config/btop/themes/$THEME.theme"
    if [ -f "$HOME/.config/btop/btop.conf" ]; then
      sed -i "s/color_theme = \".*\"/color_theme = \"$THEME\"/g" "$HOME/.config/btop/btop.conf"
    fi
  else
    if [ -f "$HOME/.config/btop/btop.conf" ]; then
      sed -i "s/color_theme = \".*\"/color_theme = \"Default\"/g" "$HOME/.config/btop/btop.conf"
    fi
  fi
fi

# Fish shell colors
if command -v fish &>/dev/null; then
  if [ -f "$OMAKDOT_PATH/themes/$THEME/fish.fish" ]; then
    fish -c "source $OMAKDOT_PATH/themes/$THEME/fish.fish"
  fi
fi

# Chrome/Chromium theme color via enterprise policy
CHROMIUM_THEME_FILE="$OMAKDOT_PATH/themes/$THEME/chromium.theme"
if [ -f "$CHROMIUM_THEME_FILE" ]; then
  THEME_RGB=$(<"$CHROMIUM_THEME_FILE" tr -d '[:space:]')
  THEME_HEX=$(printf '#%02x%02x%02x' ${THEME_RGB//,/ })

  set_browser_policy() {
    local policy_dir="$1"
    sudo mkdir -p "$policy_dir" 2>/dev/null || return
    echo "{\"BrowserThemeColor\": \"$THEME_HEX\", \"BrowserColorScheme\": \"device\"}" | sudo tee "$policy_dir/color.json" >/dev/null
  }

  set_browser_policy /etc/opt/chrome/policies/managed
  set_browser_policy /etc/chromium/policies/managed

  # Refresh running browser
  if pgrep -x chrome >/dev/null 2>&1; then
    google-chrome-stable --refresh-platform-policy --no-startup-window &>/dev/null || true
  fi
  if pgrep -x chromium >/dev/null 2>&1; then
    chromium --refresh-platform-policy --no-startup-window &>/dev/null || true
  fi
fi

# GNOME desktop theme (wallpaper, GTK, accent color)
source "$OMAKDOT_PATH/themes/$THEME/gnome.sh"

# VS Code theme
source "$OMAKDOT_PATH/themes/$THEME/vscode.sh"

# Save current theme
mkdir -p "$HOME/.config/omakdot"
echo "$THEME" > "$HOME/.config/omakdot/current-theme"
