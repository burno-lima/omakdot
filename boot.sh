#!/bin/bash

set -e

echo ""
echo "   ____                __   ______                          "
echo "  / __ \____ ___  ____ / /__/ ____/___  ____  ____ ___  ___ "
echo " / / / / __ \`__ \/ __ \`/ //_/ / __/ __ \/ __ \/ __ \`__ \/ _ \\"
echo "/ /_/ / / / / / / /_/ / ,< / /_/ / / / / /_/ / / / / / /  __/"
echo "\____/_/ /_/ /_/\__,_/_/|_|\____/_/ /_/\____/_/ /_/ /_/\___/ "
echo ""
echo "  Development Environment Setup & Theme Automation"
echo ""
echo "=> Installs dev tools (terminal) + desktop apps + GNOME theme system"
echo ""
echo "Begin installation (or abort with ctrl+c)..."
echo ""

if ! command -v git &>/dev/null; then
  echo "Error: git is required. Please install git and try again."
  exit 1
fi

echo "Cloning OmakDot..."
rm -rf ~/.local/share/omakdot
git clone https://github.com/burno-lima/omakdot.git ~/.local/share/omakdot >/dev/null
if [[ -n "$OMAKDOT_REF" && "$OMAKDOT_REF" != "master" ]]; then
	cd ~/.local/share/omakdot
	git fetch origin "$OMAKDOT_REF" && git checkout "$OMAKDOT_REF"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omakdot/install.sh
