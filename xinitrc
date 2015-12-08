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
xinput disable "ELAN Touchscreen"

#############
## Startup ##
#############

# Do background stuff
sleep 1 && unclutter & # Hides mousecursor when inactive
sleep 1 && urxvtd -q -o -f &

# Launch programs
sleep 1 && firefox &
sleep 1 && urxvt &
sleep 1 && thunderbird &
sleep 1 && nm-applet &
sleep 1 && xfce4-power-manager &
sleep 1 && owncloud &

# make sure there's only one redshift service running
if ! ps ax | grep -v grep | grep redshift > /dev/null
then
    sleep 1 && redshift -l 52.2:13.6 -t 6500:4200 -m randr -v
fi &

################
## Log errors ##
################

for errfile in "$HOME/.wm-errors" "${TMPDIR-/tmp}/wm-$USER" "/tmp/wm-$USER"
do
  if ( cp /dev/null "$errfile" 2> /dev/null )
  then
    chmod 600 "$errfile" &
    exec > "$errfile" 2>&1 &
    break
  fi
done &

xbindkeys
