#!/bin/bash
# Script to start programs on terminal workspace
# from https://github.com/fhaun/config-misc/blob/master/i3-stuff/auto-start-for-i3

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

i3-msg Workspace "10 "
title="glances-phoenix"
if ! is_running $title
then
    start "gnome-terminal -t glances-phoenix -x ssh -t phoenix glances"
    wait_for_title "glances-phoenix"
fi
title="glances-pegasus"
if ! is_running $title
then
    i3-msg split h
    start "gnome-terminal -t glances-pegasus -x ssh -t pegasus glances"
    wait_for_title "glances-pegasus"
fi
title="glances-oberth"
if ! is_running $title
then
    i3-msg focus left
    i3-msg split v
    start "gnome-terminal -t glances-oberth -x ssh -t oberth glances"
    wait_for_title "glances-oberth"
fi
title="glances-enterprise-01"
if ! is_running $title
then
    i3-msg focus right
    i3-msg split v
    start "gnome-terminal -t glances-enterprise-01 -x ssh -t enterprise-01 glances"
    wait_for_title "glances-enterprise-01"
fi
