#!/bin/bash

set -euo pipefail

source _setup-scripts/utils.sh

run_with_sudo apt-get install stow

dirs=(autorandr asdf bin fonts git gtk gnupg i3wm notify obsidian redshift ruby tmux tmuxifier vim x zsh)
for dir in "${dirs[@]}"; do
  stow $dir --target=$HOME/ --dir=$HOME/.dotfiles
done
