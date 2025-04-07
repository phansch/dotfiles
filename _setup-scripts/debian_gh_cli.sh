#!/bin/bash
set -euo pipefail

# shellcheck source=_setup-scripts/utils.sh
source _setup-scripts/utils.sh

# Script from https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-raspberry-pi-os-apt
# shellcheck disable=2002
(type -p wget >/dev/null || (run_with_sudo apt update && run_with_sudo apt-get install wget -y)) \
	&& run_with_sudo mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && wget -nv -O"$out" https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat "$out" | run_with_sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& run_with_sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | run_with_sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& run_with_sudo apt update \
	&& run_with_sudo apt install gh -y
