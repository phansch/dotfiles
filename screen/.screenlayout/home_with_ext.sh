#!/bin/sh
xrandr && xrandr --auto && xrandr \
  --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal \
  --output DVI-I-1-1 --mode 1920x1080 --right-of eDP-1
set_wallpaper
