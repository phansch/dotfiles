#!/bin/bash
ip="$1"

# Taken from https://stackoverflow.com/a/53598510
# Probably only works with XFCE
# Will only work if the cron is run by the user
export XDG_RUNTIME_DIR=/run/user/$(id -u)

ping -q -c 1 "$ip"
exitcode=$?

if [[ $exitcode == "1" ]]; then
  notify-send -u "critical" -t 10000 "CHECK IP FAILURE" "Could not reach $ip"
fi
