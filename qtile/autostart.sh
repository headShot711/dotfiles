#!/bin/sh
xrandr -s 1920x1080
feh --bg-scale /home/hs/walls/tn-glados-better.jpg
nm-applet &
nitrogen --restore &
picom &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
