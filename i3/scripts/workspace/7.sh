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

i3-msg Workspace "7 "
dex /usr/share/applications/remmina.desktop
wait_for_title "remmina"
