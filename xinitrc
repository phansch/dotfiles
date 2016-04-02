#!/bin/bash
#
# .xinitrc - Called by startx
#

#############
## X Stuff ##
#############

xset m 4 & # Increase mouse acceleration
xset s off # don't activate screensaver
xset s noblank # don't blank the video device
xrdb -merge ~/.Xresources & # reread ~/.Xresources
setxkbmap 'de(dvorak)' & # Set german dvorak keyboard layout
# TODO: Check for hostname of laptop to disable it
xinput disable "ELAN Touchscreen" &

#############
## Startup ##
#############

export $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

# Set wallpaper
feh --no-fehbg --bg-scale ~/images/current_wallpaper &

# Do background stuff
sleep 1 && unclutter -noevents -root & # Hides mousecursor when inactive
sleep 1 && urxvtd -q -o -f &

# Launch programs
sleep 1 && nm-applet &
sleep 1 && qutebrowser &

# make sure there's only one redshift service running
if ! ps ax | grep -v grep | grep redshift > /dev/null
then
    sleep 1 && redshift -l 52.2:13.6 -t 6500:4200 -m randr -v
fi &
