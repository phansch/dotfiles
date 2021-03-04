#!/bin/bash
ip="$1"

ping -q -c 1 "$ip" &>/dev/null
exitcode=$?

if [[ $exitcode != "0" ]]; then
  echo "CRITICAL: Could not reach $ip"
else
  echo "OK: $ip reachable"
fi

exit $exitcode
