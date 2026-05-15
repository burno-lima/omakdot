#!/bin/bash

set -e

echo ""
echo "   ____                __   ______                          "
echo "  / __ \____ ___  ____ / /__/ ____/___  ____  ____ ___  ___ "
echo " / / / / __ \`__ \/ __ \`/ //_/ / __/ __ \/ __ \/ __ \`__ \/ _ \\"
echo "/ /_/ / / / / / / /_/ / ,< / /_/ / / / / /_/ / / / / / /  __/"
echo "\____/_/ /_/ /_/\__,_/_/|_|\____/_/ /_/\____/_/ /_/ /_/\___/ "
echo ""
echo "  GNOME Theme Automation Tool"
echo ""
echo "=> Requires GNOME desktop environment"
echo ""
echo "Begin installation (or abort with ctrl+c)..."
echo ""

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
