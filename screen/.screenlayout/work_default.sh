#!/bin/sh
xrandr && xrandr --output DP-1-1 --mode 1920x1080 --scale 1x1 --primary \
  --output DP-1-3 --rotate left --mode 1920x1200 --scale 1x1 --left-of DP-1-1 \
  --output eDP-1 --scale 0.8x0.8 --mode 1920x1080 --right-of DP-1-1 \
  --output DP-1 --off \
  --output HDMI-1 --off \
  --output DP-2 --off \
  --output HDMI-2 --off \
  --output DP-1-2 --off
