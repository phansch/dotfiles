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

# Set German keyboard layout, with alt_space to switch between de and de(dvorak)
sleep 1 && setxkbmap 'de,de(dvorak)' -option 'grp:alt_space_toggle,ctrl:nocaps' 'de,de(dvorak)' &
sleep 1 && xset m 4 & # Increase mouse acceleration
sleep 1 && xrdb -merge ~/.Xresources # reread ~/.Xresources

# TODO: Proper rewrite for screen section.
# 		* Determine xrandr settings for different computers by hostname and
# 		  available screens

# netbook screen setup at parents
#if [[ "$(xrandr | grep 'VGA1 connected')" != "" ]]; then
#	sleep 1 && xrandr --output VGA1 --mode 1680x1050 &
#	sleep 1 && xrandr --output LVDS1 --off &
#else
#	sleep 1 && xrandr --output LVDS1 --mode 1366x768 &
#	sleep 1 && xrandr --output VGA1 --off &
#fi &

# Screen setup at home berlin
sleep 2 && xrandr --output HDMI-0 --mode 1920x1080 &
sleep 2 && xrandr --output DVI-1 --mode 1920x1080 --left-of HDMI-0 &

##########
## Misc ##
##########

# Do background stuff
sleep 1 && unclutter & # Hides mousecursor when inactive
sleep 1 && emptytrash & # Empty trash (duh)
sleep 2 && sh ~/.fehbg & # background
sleep 1 && ~/.btsync/btsync & # Start btsync daemon
sleep 1 && bugwarrior-pull & # Pull github issues to taskwarrior

# Launch programs
sleep 1 && firefox &
sleep 1 && xfce4-panel --disable-wm-check &
#sleep 1 && urxvt -e weechat-curses & # irc

sleep 1 && urxvt &
sleep 1 && urxvt -e routines &
sleep 1 && urxvt -e cvlc ~/Music/Radios/dronezone32.pls -I ncurses & # open vlc
sleep 1 && subl & # open sublime-text
sleep 1 && skype &

# make sure there's only one redshift service running
if ! ps ax | grep -v grep | grep redshift > /dev/null
then
    sleep 1 && redshift -l 52.2:13.6 -t 6500:4200 -m randr -v
fi &

# Show date and time in dwm top bar
while true; do xsetroot -name "$(date +"%d.%m %R" )";sleep 1m;done &

exec dwm
