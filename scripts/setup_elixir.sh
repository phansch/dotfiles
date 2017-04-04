#!/bin/sh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir
asdf install elixir 1.2.4
asdf global elixir 1.2.4
asdf install erlang 18.3
asdf global erlang 18.3
