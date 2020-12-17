#!/bin/sh
xrandr --output DP-1-1 --off
xrandr && xrandr \
  --output DP-1-1 --mode 1920x1080 --primary --rotate normal \
  --output eDP-1 --mode 1920x1080 --right-of DP-1-1 --rotate normal
set_wallpaper
