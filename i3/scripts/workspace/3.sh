#!/bin/bash
# Script to start programs on terminal workspace
# from https://github.com/fhaun/config-misc/blob/master/i3-stuff/auto-start-for-i3

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

i3-msg Workspace "3 "
title="matt@$HOSTNAME.*byobu"
if ! is_running $title
then
    start "gnome-terminal -t byobu -x byobu"
    # The first start always seems to fail, so try it again
    # sleep 2
    # start "gnome-terminal -t byobu -x byobu"
    wait_for_title $title
fi

title="ssh-pegasus"
if ! is_running $title
then
    i3-msg split h
    start "gnome-terminal -t ssh-pegasus -x ssh pegasus"
    wait_for_title $title
else
    echo "$title is already running"
fi
