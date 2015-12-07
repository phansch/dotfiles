#!/usr/bin/env bash

if ! ps ax | grep -v grep | grep redshift > /dev/null
then
  redshift -l 52.2:13.6 -t 6500:3400 -m randr -v
fi
