#!/bin/sh
xrandr && xrandr \
  --output DP-1-1 --mode 1920x1080 --pos 0x0 --primary --rotate normal \
  --output eDP-1 --mode 1920x1080 --pos 0x0 --right-of DP-1-1 --rotate normal
set_wallpaper
