# maximum time to wait for a program to start
MAXWAIT=10

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

# gollum
# /home/matt/gollum.sh &
# /home/matt/gollum-zenoss.sh &

# background
feh --bg-fill ~/Pictures/wallpaper/nes/earthbound-onett.png

# sound switcher
# required because gnome settings doesn't work right now
# indicator-sound-switcher &

# 1: Personal
# 2: Work
## chrome has window rules
# start "google-chrome --user-data-dir=.config/google-chrome/Default"
# start "google-chrome --user-data-dir=.config/google-chrome/Profile\ 1"
dex ~/.local/share/applications/google-chrome-personal.desktop ~/.local/share/applications/google-chrome-work.desktop
# wait_for_title "Google Chrome"

# 3: terminal
i3-msg Workspace 3: terminal
dex /usr/share/applications/byobu.desktop
sleep 2

# 4: dev
i3-msg Workspace 4: dev
start "gnome-terminal -t byobu -x ssh nova"
sleep 2

# 5: chat
i3-msg Workspace 5: chat
start "gnome-terminal -t byobu -x ssh pegasus"
sleep 2

# 6: game
i3-msg Workspace 6: game
start "gnome-terminal -t byobu -x ssh oberth"
sleep 2

# 7: vm

# 8: audio

# return to 3: terminal
i3-msg Workspace 3: terminal
dex /usr/share/applications/synapse.desktop

# restart i3 so the bars are correct (multi-monitor issue)
i3-msg restart
