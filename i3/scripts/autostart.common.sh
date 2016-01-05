#!/bin/bash
# disable desktop (nautilus & nemo)
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop.background show-desktop-icons false
gsettings set org.nautilus.desktop.background show-desktop-icons false

# use compton as compositor
# --unredir-if-possible: fix performance issues with full-screen programs
compton -cCGb --backend glx --vsync opengl --unredir-if-possible
