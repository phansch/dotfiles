#!/bin/sh
umask 0077
cfg_tmpdir="/run/user/$(id -u "$USER")/my-i3lock"
image_path="$cfg_tmpdir/screen.png"

mkdir -p "$cfg_tmpdir"

scrot "$cfg_tmpdir/screen.png"

convert "$image_path" -blur 4x8 "$image_path"

j "[`hostname`] Locking Screen"
i3lock -u -n -t -i "$image_path"

j "[`hostname`] Unlocking screen"
