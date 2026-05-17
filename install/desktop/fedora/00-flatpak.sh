#!/bin/bash

# Flatpak is pre-installed on Fedora; just ensure Flathub remote is available
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
