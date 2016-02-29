# Script to start programs on terminal workspace
# from https://github.com/fhaun/config-misc/blob/master/i3-stuff/auto-start-for-i3

# xdg autostart (/etc/xdg/autostart and ~/.config/autostart)
dex -ae i3

# This needs to be started so Software Center works properly
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# redshift
redshift-gtk &

# gollum
/home/matt/gollum.sh &
/home/matt/gollum-zenoss.sh &

# background
# feh --bg-fill --no-xinerama /home/matt/Pictures/wallpaper/abstract-sphere.jpg
# feh --bg-fill --no-xinerama /home/matt/Pictures/wallpaper/nature/YS4_5968_69_70-2-3.jpg
feh --bg-tile /home/matt/Pictures/wallpaper/pattern/stardust.png
# feh --bg-scale /home/matt/Pictures/wallpaper/Night-city-street_1920x1080.jpg
# earthbound background
# feh --bg-fill ~/Pictures/wallpaper/nes/earthbound-onett.png

# sound switcher
# required because gnome settings doesn't work right now
# indicator-sound-switcher &

# Start czaban hour 1 on weekday login
if [[ $(date +%u) -lt 6 ]] ; then
    czaban --hour 1
fi

# Disable screen blanking
/home/matt/src/scripts/disable-screen-blank

# restart i3 so the bars are correct (multi-monitor issue from nova)
# i3-msg restart
