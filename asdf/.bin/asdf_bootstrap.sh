#!/bin/bash

set -x

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1

# shellcheck disable=SC1091
. "$HOME/.asdf/asdf.sh"

asdf plugin add python
asdf plugin add ruby
asdf plugin add nodejs
asdf plugin add rust

asdf install python latest
asdf install python 3.13.2
asdf install rust latest
asdf install ruby latest
asdf install nodejs latest

asdf global nodejs latest
asdf global ruby latest
asdf global python latest
