#!/bin/bash
#
# Author: Raphael P. Ribeiro <raphaelpr01@gmail.com> 
# Modified by: Matthew Parlette <matthew.parlette@gmail.com>

ISON=$(ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo On || echo Off) # IS ON?
echo -e "\uf1e4" #full_text
echo "net" #short_text
if [ "$ISON" = "Off" ]; then # no internet? color will turn red
    echo "#fb0120"
else
    echo "#a1c659"    
fi
