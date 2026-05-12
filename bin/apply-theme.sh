#!/bin/bash
# Apply an OmakGnome theme by name
# Usage: apply-theme.sh <theme-id>

THEME="$1"
export OMAKGNOME_PATH="${OMAKGNOME_PATH:-$HOME/.local/share/omakgnome}"

if [ -z "$THEME" ] || [ ! -d "$OMAKGNOME_PATH/themes/$THEME" ]; then
  echo "Usage: apply-theme.sh <theme-id>"
  echo "Available: tokyo-night catppuccin nord everforest gruvbox kanagawa ristretto rose-pine matte-black osaka-jade"
  exit 1
fi

# Alacritty
if [ -d "$HOME/.config/alacritty" ]; then
  cp "$OMAKGNOME_PATH/themes/$THEME/alacritty.toml" "$HOME/.config/alacritty/theme.toml"
fi

# Zellij
if [ -d "$HOME/.config/zellij" ]; then
  mkdir -p "$HOME/.config/zellij/themes"
  cp "$OMAKGNOME_PATH/themes/$THEME/zellij.kdl" "$HOME/.config/zellij/themes/$THEME.kdl"
  if [ -f "$HOME/.config/zellij/config.kdl" ]; then
    sed -i "s/theme \".*\"/theme \"$THEME\"/g" "$HOME/.config/zellij/config.kdl"
  fi
fi

# Neovim
if [ -d "$HOME/.config/nvim" ]; then
  mkdir -p "$HOME/.config/nvim/lua/plugins"
  cp "$OMAKGNOME_PATH/themes/$THEME/neovim.lua" "$HOME/.config/nvim/lua/plugins/theme.lua"
fi

# btop
if [ -d "$HOME/.config/btop" ]; then
  mkdir -p "$HOME/.config/btop/themes"
  if [ -f "$OMAKGNOME_PATH/themes/$THEME/btop.theme" ]; then
    cp "$OMAKGNOME_PATH/themes/$THEME/btop.theme" "$HOME/.config/btop/themes/$THEME.theme"
    if [ -f "$HOME/.config/btop/btop.conf" ]; then
      sed -i "s/color_theme = \".*\"/color_theme = \"$THEME\"/g" "$HOME/.config/btop/btop.conf"
    fi
  else
    if [ -f "$HOME/.config/btop/btop.conf" ]; then
      sed -i "s/color_theme = \".*\"/color_theme = \"Default\"/g" "$HOME/.config/btop/btop.conf"
    fi
  fi
fi

# GNOME desktop theme (wallpaper, GTK, accent color)
source "$OMAKGNOME_PATH/themes/$THEME/gnome.sh"

# VS Code theme
source "$OMAKGNOME_PATH/themes/$THEME/vscode.sh"

# Save current theme
mkdir -p "$HOME/.config/omakgnome"
echo "$THEME" > "$HOME/.config/omakgnome/current-theme"
