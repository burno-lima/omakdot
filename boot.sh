#!/bin/bash

set -e

echo "╔═══════════════════════════════════════╗"
echo "║           OmakGnome                   ║"
echo "║   GNOME Theme Automation Tool         ║"
echo "╚═══════════════════════════════════════╝"
echo ""
echo "=> Requires GNOME desktop environment"
echo -e "\nBegin installation (or abort with ctrl+c)..."

if ! command -v git &>/dev/null; then
  echo "Error: git is required. Please install git and try again."
  exit 1
fi

echo "Cloning OmakGnome..."
rm -rf ~/.local/share/omakgnome
git clone https://github.com/burno-lima/omakgnome.git ~/.local/share/omakgnome >/dev/null
if [[ -n "$OMAKGNOME_REF" && "$OMAKGNOME_REF" != "master" ]]; then
	cd ~/.local/share/omakgnome
	git fetch origin "$OMAKGNOME_REF" && git checkout "$OMAKGNOME_REF"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omakgnome/install.sh
