#!/usr/bin/env bash

if ! pgrep -x redshift > /dev/null
then
  # Make sure we reset any exisiting redshift values first
  redshift -x
  redshift -l 52.2:13.6 -t 6500:2200 -m randr &
fi
