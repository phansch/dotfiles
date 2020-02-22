#!/bin/sh
xrandr && xrandr \
  --output DVI-I-1-1 --off \
  --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal
