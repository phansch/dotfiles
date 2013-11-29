#!/bin/bash
#
# .xinitrc - Called by startx
#
# Known issues:
# Startup doesn't work correctly some times:
#  * Sometimes, xrandr doesn't seem to make a change.
#  * Sometimes, programs are not starting
# 'sleep N' tries to fix that, but it's still not reliable

#############
## X Stuff ##
#############

xset m 4 & # Increase mouse acceleration
xrdb -merge ~/.Xresources & # reread ~/.Xresources
xsetroot -solid OldLace & # background color
setxkbmap 'de(dvorak)' & # Set german dvorak keyboard layout

# TODO: Proper rewrite for screen section.
#       * Determine xrandr settings for different computers by hostname and
#         available screens.

# netbook screen setup
if [[ "$(xrandr | grep 'HDMI1 connected')" != "" ]]; then
  sleep 1 && xrandr --output LVDS1 --mode 1366x768 &
  sleep 1 && xrandr --output HDMI1 --mode 1920x1080 --right-of LVDS1 &
else
  sleep 1 && xrandr --output LVDS1 --mode 1366x768 &
  sleep 1 && xrandr --output HDMI1 --off &
fi &

##########
## Misc ##
##########

# Do background stuff
sleep 1 && unclutter & # Hides mousecursor when inactive
sleep 1 && emptytrash & # Empty trash (duh)

# Launch programs
sleep 1 && firefox &
sleep 1 && urxvt -e cvlc ~/Music/Radios/dronezone32.pls --browse-dir ~/Music/ -I ncurses & # open vlc
sleep 1 && subl & # open sublime-text
sleep 1 && skype &
sleep 1 && nm-applet &
sleep 1 && xfce4-power-manager &
sleep 1 && hexchat &

# make sure there's only one redshift service running
if ! ps ax | grep -v grep | grep redshift > /dev/null
then
    sleep 1 && redshift -l 52.2:13.6 -t 6500:4200 -m randr -v
fi &

# Show date and time in dwm top bar
while true; do xsetroot -name "$(date +"%d.%m %R" )";sleep 1m;done &

exec dwm