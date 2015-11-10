#!/bin/bash

# Setup layout
#  workstation
if [ $(xrandr | grep "\Wconnected" | awk '{ print $1 }' | wc -l) = 3 ]; then
    # Need to rotate monitors and assign workspaces to be on specific monitors
    echo "on workstation"
    # rotate left monitor counter-clockwise
    xrandr --output DVI-I-1 --rotate left --output HDMI-0 --right-of DVI-I-1 --primary --output DVI-D-0 --right-of HDMI-0 --rotate left
fi

#  tv
if [ $(xrandr | grep "\Wconnected" | awk '{ print $1 }' | wc -l) = 1 ]; then
    # No changes need to be done here, all workspaces go to the only monitor available
    echo "on tv"
fi

# Setup workspaces assigned to specific monitors
