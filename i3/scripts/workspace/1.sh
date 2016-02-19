#!/bin/bash
# Script to start programs on terminal workspace
# from https://github.com/fhaun/config-misc/blob/master/i3-stuff/auto-start-for-i3

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

i3-msg Workspace "1 "
# title="google-chrome (.*Default)"
# if ! is_running $title
# then
dex ~/.local/share/applications/chrome-app-list-personal.desktop
# fi
