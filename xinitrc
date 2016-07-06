#!/bin/sh
#
# .xinitrc - Called by startx
#

#############
## X Stuff ##
#############

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xset m 4 & # Increase mouse acceleration
xset s off # don't activate screensaver
xset -dpms
xset s noblank # don't blank the video device
xrdb -merge ~/.Xresources & # reread ~/.Xresources
setxkbmap 'de(dvorak)' & # Set german dvorak keyboard layout
# TODO: Check for hostname of laptop to disable it
xinput disable "ELAN Touchscreen" &

#############
## Startup ##
#############

eval $(ssh-agent)
export $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

# Set wallpaper
feh --no-fehbg --bg-scale ~/Pictures/current_wallpaper &

# Do background stuff
sleep 1 && unclutter -noevents -root & # Hides mousecursor when inactive
sleep 1 && urxvtd -q -o -f &
sleep 1 && /usr/lib/x86_64-linux-gnu/deja-dup/deja-dup-monitor &

# Launch programs
sleep 1 && nm-applet &

# make sure there's only one redshift service running
if ! ps ax | grep -v grep | grep redshift > /dev/null
then
    sleep 1 && redshift -l 52.2:13.6 -t 6500:4200 -m randr -v
fi &
