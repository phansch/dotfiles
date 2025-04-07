#!/bin/bash

set -x

version="v0.16.7"
wget "https://github.com/asdf-vm/asdf/releases/download/$version/asdf-$version-linux-amd64.tar.gz" -P /tmp/
mkdir -p /opt/asdf/
tar -xvf /tmp/asdf-$version-linux-amd64.tar.gz -C /opt/asdf/

asdf="/opt/asdf/asdf"
$asdf info

$asdf plugin add python
$asdf plugin add ruby
$asdf plugin add nodejs
$asdf plugin add rust

$asdf install python latest
$asdf install python 3.13.2
$asdf install rust latest
$asdf install ruby latest
$asdf install nodejs latest

$asdf set --home nodejs latest
$asdf set --home ruby latest
$asdf set --home python latest
