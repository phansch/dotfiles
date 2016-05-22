#!/bin/sh
umask 0077
cfg_tmpdir="/run/user/$UID/my-i3lock"
image_path="$cfg_tmpdir/screen.png"

mkdir -p "$cfg_tmpdir"

scrot "$cfg_tmpdir/screen.png"

convert "$image_path" -blur 4x8 -grayscale rec601luma "$image_path"

i3lock -u -n -t -i "$image_path"