#!/bin/bash
#
# Author: Matthew Parlette <matthew.parlette@gmail.com>
# 
# Check if highstate has been run in the past 24 hours
# Highstate will touch /var/highstate.time on completion
OUTPUT=$(pactl list short sinks | grep G930 | grep RUNNING && echo headphones || echo speakers)
if [ "$OUTPUT" = "speakers" ]; then
    echo -e "\uf026" #full_text
    echo "speakers" #short_text
    echo "#fb0120" # Red
else
    echo -e "\uf025" #full_text
    echo "headphones" #short_text
    echo "#a1c659" # Green
fi
