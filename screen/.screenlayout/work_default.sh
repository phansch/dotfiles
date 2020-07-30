#!/bin/sh
xrandr && xrandr --output DP-2-1 --mode 1920x1080 --scale 1x1 --primary \
  --output DP-2-3 --rotate left --mode 1920x1200 --scale 1x1 --right-of DP-2-1 \
  --output eDP-1 --scale 1x1 --mode 3840x2160 --right-of DP-2-3 \
  --output DP-1 --off \
  --output HDMI-1 --off \
  --output DP-2 --off \
  --output HDMI-2 --off \
  --output DP-1-2 --off
set_wallpaper
