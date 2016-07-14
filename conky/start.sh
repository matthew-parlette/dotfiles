#!/bin/bash
# First stop any running processes, then start conky

# Kill any conky running
killall -q conky
# Kill any xwinwrap
killall -q xwinwrap

# Set wallpaper
feh --bg-fill /home/matt/matthew.parlette@gmail.com/wallpaper/system/phoenix/dots-and-dashes.png

# Start xwinwrap
/home/matt/.conky/candy.sh /home/matt/.conky/quark.gif &
# Start conky
conky -c /home/matt/.conky/conky_cpus
conky -c /home/matt/.conky/conky_cpu_history
conky -c /home/matt/.conky/conky_hdd
conky -c /home/matt/.conky/conky_loggs
conky -c /home/matt/.conky/conky_connections
