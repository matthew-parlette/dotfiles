# Script to start programs on terminal workspace
# from https://github.com/fhaun/config-misc/blob/master/i3-stuff/auto-start-for-i3
# disable mouse while laying out windows
# mouseID=`xinput list | grep -Eo 'Mouse\s.*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
# touchID=`xinput list | grep -Eo 'TouchPad\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
# xinput set-prop $mouseID "Device Enabled" 0
# xinput set-prop $touchID "Device Enabled" 0

# maximum time to wait for a program to start
MAXWAIT=30

start() {
    eval "$@ &"                  # Handle arguments with whitspaces
    echo "$@ started, waiting for pid..."
}

# wait for a class name to show up in i3 window list
wait_for_title () {
    title=$1
    for i in `seq $MAXWAIT`
    do
        echo "waiting for $title in 'i3-msg -t get_tree'..."
        if i3-msg -t get_tree | egrep "$title"; then
            echo "$title found, returning..."
            return 0
        fi
        sleep 1
    done
}

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
# feh --bg-tile /home/matt/Pictures/wallpaper/pattern/stardust.png
# feh --bg-scale /home/matt/Pictures/wallpaper/Night-city-street_1920x1080.jpg
# earthbound background
feh --bg-fill ~/Pictures/wallpaper/nes/earthbound-onett.png

# sound switcher
# required because gnome settings doesn't work right now
indicator-sound-switcher &

# 1: Personal
# 2: Work

# 4: dev
# i3-msg Workspace 4: dev
# start "gnome-terminal -t byobu -x byobu"
# wait_for_title "matt@nova.* - byobu"
# sleep 2

# 3: terminal
# i3-msg Workspace 3: terminal
# # i3-msg focus left
# start "gnome-terminal -t byobu -x ssh oberth"
# wait_for_title "matt@oberth.*"
# i3-msg split v
# start "gnome-terminal -t byobu -x ssh pegasus"
# wait_for_title "matt@pegasus.*"
# sleep 2

# 5: chat
i3-msg Workspace 5: chat
dex /usr/share/applications/slack.desktop
sleep 2

# 7: vm
# start xp on weekdays
# if [[ $(date +%u) -lt 6 ]] ; then
#     i3-msg Workspace 7: vm
#     start "vboxmanage startvm xp"
#     wait_for_title "Oracle VM Virtualbox"
#     sleep 2
# fi

# 8: audio

# restart i3 so the bars are correct (multi-monitor issue)
i3-msg restart
