git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1

. "$HOME/.asdf/asdf.sh"

asdf plugin add python
asdf plugin add ruby

asdf install python 3.13.0
asdf install ruby latest
