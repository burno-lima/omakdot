#!/bin/bash

sudo dnf install -y pipx
pipx ensurepath
pipx install gnome-extensions-cli --system-site-packages

gext install blur-my-shell@aunetx

sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell\@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
