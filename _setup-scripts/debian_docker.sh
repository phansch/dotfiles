#!/bin/bash
set -euo pipefail

# shellcheck source=_setup-scripts/utils.sh
source _setup-scripts/utils.sh

# Add Docker's official GPG key:
run_with_sudo apt-get update
run_with_sudo apt-get install -y -qq ca-certificates curl
run_with_sudo install -m 0755 -d /etc/apt/keyrings
run_with_sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
run_with_sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  run_with_sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
run_with_sudo apt-get update

run_with_sudo apt-get install -y -qq docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
