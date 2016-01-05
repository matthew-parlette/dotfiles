#!/bin/bash
#
# Author: Matthew Parlette <matthew.parlette@gmail.com>
# 
# Check if a location is mounted
loc=/media/storage

ISUP=$(mount|grep "$loc" > /dev/null && echo On || echo Off) # Is mounted?
echo -e "\uf07c" #full_text
echo "mnt" #short_text
if [ "$ISUP" = "Off" ]; then # no internet? color will turn red
    echo "#fb0120" # Red
else
    echo "#a1c659" # Green
fi
