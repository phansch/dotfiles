#!/bin/bash
set -euo pipefail

# shellcheck source=_setup-scripts/utils.sh
source _setup-scripts/utils.sh

/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2025.03.09_all.deb keyring.deb SHA256:2c2601e6053d5c68c2c60bcd088fa9797acec5f285151d46de9c830aaba6173c
run_with_sudo apt install -y ./keyring.deb
echo "deb [signed-by=/usr/share/keyrings/sur5r-keyring.gpg] http://debian.sur5r.net/i3/ $(grep '^VERSION_CODENAME=' /etc/os-release | cut -f2 -d=) universe" | run_with_sudo tee /etc/apt/sources.list.d/sur5r-i3.list
run_with_sudo apt update
run_with_sudo apt install -y -qq i3
