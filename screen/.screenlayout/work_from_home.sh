#!/bin/sh

# Need to turn the output off an on again to make it work.
# Without this, it would not turn on.
xrandr --output DP-1-1 --off
xrandr && xrandr \
  --output DP-2-2 --mode 1920x1080 --pos 0x0 --primary --rotate normal \
  --output eDP-1 --mode 1920x1080 --pos 0x0 --right-of DP-2-2 --rotate normal
set_wallpaper
