#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

i3-msg Workspace "8 "
title="Sonos"
if ! is_running $title
then
    dex /home/matt/.local/share/applications/wine/Programs/Sonos/Sonos.desktop
fi
