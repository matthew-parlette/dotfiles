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
krawall --resort

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
i3-msg restart
