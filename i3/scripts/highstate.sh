#!/bin/bash
#
# Author: Matthew Parlette <matthew.parlette@gmail.com>
# 
# Check if highstate has been run in the past 24 hours
# Highstate will touch /var/highstate.time on completion
TEST=$(find /tmp -name highstate.time -mtime 0 | grep highstate && echo Pass || echo Fail)
echo -e "\uf013" #full_text
echo "salt" #short_text
if [ "$TEST" = "Fail" ]; then
    echo "#fb0120" # Red
else
    echo "#a1c659" # Green
fi
