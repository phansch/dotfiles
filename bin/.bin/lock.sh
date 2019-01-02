#!/bin/sh
umask 0077
cfg_tmpdir="/run/user/$(id -u "$USER")/my-i3lock"
image_path="$cfg_tmpdir/screen.png"

mkdir -p "$cfg_tmpdir"

scrot "$cfg_tmpdir/screen.png"

convert "$image_path" -blur 4x8 "$image_path"

i3lock -u -n -t -i "$image_path"

# Show scratchpad after screen is unlocked
# I use this in the morning and evening to review my notes
i3-msg '[instance="urxvt" title="vimwiki"] scratchpad show' >/dev/null 2>&1
i3-msg '[class="^Anki$"] show' >/dev/null 2>&1
