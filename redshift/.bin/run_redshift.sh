#!/usr/bin/env bash

if ! pgrep -x redshift > /dev/null
then
  redshift -l 52.2:13.6 -t 6500:3400 -m randr -v &
fi
