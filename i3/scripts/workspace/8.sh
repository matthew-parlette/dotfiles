#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

i3-msg Workspace "8 "
title="pianobar"
if ! is_running $title
then
    start "gnome-terminal -t pianobar -x pianobar"
    wait_for_title $title
fi
