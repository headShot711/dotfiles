#!/bin/sh
xrandr -s 1920x1080
nitrogen --restore &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
