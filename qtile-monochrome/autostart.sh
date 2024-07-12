#!/bin/sh
xrandr -s 1920x1080
feh --bg-fill /home/hs/walls/wall3.jpg
nm-applet &
dunst &
picom &
volumeicon &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
