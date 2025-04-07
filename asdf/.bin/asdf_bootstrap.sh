#!/bin/bash

set -euxo pipefail

version="v0.16.7"
wget "https://github.com/asdf-vm/asdf/releases/download/$version/asdf-$version-linux-amd64.tar.gz" -P /tmp/
mkdir -p "$HOME/.bin"
tar -xvf /tmp/asdf-$version-linux-amd64.tar.gz -C "$HOME/.bin"

asdf="$HOME/.bin/asdf"
export PATH="$HOME/.asdf/shims:$PATH"
$asdf info

$asdf plugin add ruby
$asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
$asdf plugin add rust

$asdf install rust latest
$asdf install ruby latest
$asdf install nodejs latest

$asdf set --home nodejs latest
$asdf set --home ruby latest
