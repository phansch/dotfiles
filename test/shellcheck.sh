#!/bin/sh

set -x

bash -O extglob -c 'shellcheck **/!(git-prompt).sh bin/* -e SC1071'
