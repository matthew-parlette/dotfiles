#!/bin/bash
#
# Author: Matthew Parlette <matthew.parlette@gmail.com>
# 
# Check if owncloud site is up
loc=https://cloud.matt.parlette.us/owncloud

ISUP=$(curl -kL "$loc" 2>&1 | grep "login" > /dev/null && echo On || echo Off) # Is accessible?
echo "owncloud" #full_text
echo "cloud" #short_text
if [ "$ISUP" = "Off" ]; then # no internet? color will turn red
    echo "#fb0120" # Red
else
    echo "#a1c659" # Green
fi
