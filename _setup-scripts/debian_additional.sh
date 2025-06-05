#!/bin/bash
set -euo pipefail

# shellcheck source=_setup-scripts/utils.sh
source _setup-scripts/utils.sh

# Use git-ppa for most recent release
run_with_sudo add-apt-repository -y ppa:git-core/ppa
run_with_sudo apt-get update
run_with_sudo apt-get install -y -qq calibre flatpak unclutter flameshot jq krita redshift git borgbackup

# Install PikaBackup
# flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# flatpak install flathub org.gnome.World.PikaBackup
