#!/bin/bash
#
# .xinitrc - Called by startx
#

#############
## X Stuff ##
#############

xset m 4 & # Increase mouse acceleration
xset s noblank # Disable screen blanking
xrdb -merge ~/.Xresources & # reread ~/.Xresources
# xsetroot -solid OldLace & # background color
sh ~/.fehbg &
setxkbmap 'de(dvorak)' & # Set german dvorak keyboard layout

# Screen setup
if [[ "$(xrandr | grep 'HDMI1 connected')" != "" ]]; then
  sleep 1 && xrandr --output LVDS1 --mode 1366x768 --output HDMI1 --mode 1920x1080 --right-of LVDS1 &
else
  sleep 1 && xrandr --output LVDS1 --mode 1366x768 --output HDMI1 --off &
fi &

#############
## Startup ##
#############

# Do background stuff
sleep 1 && unclutter & # Hides mousecursor when inactive
sleep 1 && urxvtd -q -o -f &

# Launch programs
sleep 1 && firefox-trunk &
sleep 1 && urxvt &
sleep 1 && urxvt -e cvlc ~/Music/Radios/dronezone32.pls --browse-dir ~/Music/ -I ncurses & # open vlc
sleep 1 && skype &
sleep 1 && nm-applet &
sleep 1 && xfce4-power-manager &
sleep 1 && urxvt -e weechat-curses &
sleep 1 && urxvt -e mutt &
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

##############
## Start WM ##
##############

DEFAULT_SESSION="i3"
case $1 in
openbox-session|i3)
        exec $1
        ;;
*)
        exec $DEFAULT_SESSION
        ;;
esac
