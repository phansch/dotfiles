#!/bin/sh
xrandr && xrandr --output LVDS-1 --mode 1366x768 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --mode 1360x768 --pos 1366x0 --rotate normal --output VGA-1 --off
set_wallpaper
