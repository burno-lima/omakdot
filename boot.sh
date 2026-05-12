#!/bin/bash

set -e

echo "╔═══════════════════════════════════════╗"
echo "║           OmakGnome                   ║"
echo "║   GNOME Theme Automation Tool         ║"
echo "╚═══════════════════════════════════════╝"
echo ""
echo "=> Requires Ubuntu 24.04+ with GNOME desktop"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git curl >/dev/null

echo "Cloning OmakGnome..."
rm -rf ~/.local/share/omakgnome
git clone https://github.com/burno-lima/omakgnome.git ~/.local/share/omakgnome >/dev/null
if [[ $OMAKGNOME_REF != "main" ]]; then
	cd ~/.local/share/omakgnome
	git fetch origin "${OMAKGNOME_REF:-main}" && git checkout "${OMAKGNOME_REF:-main}"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omakgnome/install.sh
