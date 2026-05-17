#!/bin/bash

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
fi

for installer in $OMAKDOT_PATH/install/desktop/common/*.sh; do
    [ -f "$installer" ] && source "$installer"
done

for installer in $OMAKDOT_PATH/install/desktop/$OS/*.sh; do
    [ -f "$installer" ] && source "$installer"
done
