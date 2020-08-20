#!/bin/sh
xrandr && xrandr \
  --output DP-1-1 --off \
  --output DP-1-3 --off \
  --output DP-1 --off \
  --output HDMI-1 --off \
  --output DP-2 --off \
  --output HDMI-2 --off \
  --output DP-2-3 --off \
  --output DP-2-1 --off \
  --output eDP-1 --mode 1920x1080 \
  --verbose
set_wallpaper
