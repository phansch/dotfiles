#!/bin/sh
xrandr && xrandr \
  --output DP-1-1 --off \
  --output DP-1-3 --off \
  --output DP-1 --off \
  --output HDMI-1 --off \
  --output DP-2 --off \
  --output HDMI-2 --off \
  --output DP-1-2 --off \
  --output eDP-1 --primary --mode 1920x1080 --scale 1.0x1.0 \
  --output DVI-I-1-1 --mode 1920x1080 --right-of eDP-1 --reflect normal --rotate normal --scale 1.0x1.0 \
  --verbose
set_wallpaper
