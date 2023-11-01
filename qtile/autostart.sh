#!/bin/sh
xrandr -s 1920x1080
nm-applet &
nitrogen --restore &
picom &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
