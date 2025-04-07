#!/bin/bash

set -euo pipefail

is_ci() {
  [[ "${CI-false}" == "true" ]] &&
    return 0 ||
    return 1
}

answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] &&
    return 0 ||
    return 1
}

ask_for_confirmation() {
  printf "%b" "$1 (y/n)"
  read -r -n 1
  printf "%b" "\n"
}

print_message() {
  printf "%b" "$1\n"
}

# This is a wrapper around sudo for docker
run_with_sudo() {
  my_sudo=""

  if [[ $(id -u) -ne 0 ]]; then
    print_message "We are not root, using 'sudo'"
    my_sudo='sudo'
  fi

  $my_sudo "$@"
}
