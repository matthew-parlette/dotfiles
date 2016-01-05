# Script to start programs on terminal workspace
# from https://github.com/fhaun/config-misc/blob/master/i3-stuff/auto-start-for-i3

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
        if i3-msg -t get_tree | egrep -q "$title"; then
            echo "$title found, returning..."
            return 0
        fi
        sleep 1
    done
}

i3-msg Workspace "10 "
start "gnome-terminal -t glances-nova -x ssh -t nova glances"
wait_for_title "glances-nova"
i3-msg split h
start "gnome-terminal -t glances-pegasus -x ssh -t pegasus glances"
wait_for_title "glances-pegasus"
i3-msg focus left
i3-msg split v
start "gnome-terminal -t glances-oberth -x ssh -t oberth glances"
wait_for_title "glances-oberth"
i3-msg focus right
i3-msg split v
start "gnome-terminal -t glances-enterprise-01 -x ssh -t enterprise-01 glances"
wait_for_title "glances-enterprise-01"
