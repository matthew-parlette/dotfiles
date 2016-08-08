#!/bin/bash
# Script to start programs on terminal workspace
# from https://github.com/fhaun/config-misc/blob/master/i3-stuff/auto-start-for-i3

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

i3-msg Workspace "9"
# title=""
# if ! is_running $title
# then
/opt/google/chrome/google-chrome --new-window --user-data-dir=.config/google-chrome/Default https://app.plex.tv/web/app https://www.netflix.com/browse
# fi
