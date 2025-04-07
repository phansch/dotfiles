#!/bin/bash
set -euo pipefail

# shellcheck source=_setup-scripts/utils.sh
source _setup-scripts/utils.sh

run_with_sudo apt-get update -qq
run_with_sudo apt-get install -y -qq autorandr build-essential cmake git-delete-merged-branches libglib2.0-dev libssl-dev lxappearance xsel xclip xbindkeys slock zsh arandr tmux git feh htop fontconfig curl ripgrep at tree scrot firejail shellcheck pulsemixer fonts-noto-color-emoji rofi xdg-utils desktop-file-utils snapd unzip
run_with_sudo apt-get purge -y dc xscreensaver transmission-gtk thunderbird pidgin

if is_ci; then
  echo "Skipping obsidian install on CI"
else
  snap install obsidian
fi
chsh -s "$(which zsh)"

git clone https://github.com/zsh-users/zsh-autosuggestions --branch v0.7.0

# Neovim
mkdir -p /opt/nvim
chmod 0755 /opt/nvim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage -O /opt/nvim/nvim
chmod 0764 /opt/nvim/nvim
run_with_sudo apt-get install -y -qq python3-neovim

# Integrate git with libsecret
run_with_sudo apt-get install -y -qq libsecret-1-0 libsecret-1-0
libsecret_path="/usr/share/doc/git/contrib/credential/libsecret"
if [[ -f "$libsecret_path/Makefile" ]]; then
  cd /usr/share/doc/git/contrib/credential/libsecret
  make
fi

# Install tmuxifier
git clone https://github.com/jimeh/tmuxifier.git --branch v0.13.0 "$HOME/.tmuxifier"
