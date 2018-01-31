#!/bin/sh
sudo pacman -S avahi
sudo pacman -S keepassx2
sudo pacman -S qutebrowser
sudo pacman -S deja-dup
sudo pacman -S zsh
sudo pacman -S neovim
sudo pacman -S xsel xbindkeys
sudo pacman -S rxvt-unicode
sudo pacman -S tmux
sudo pacman -S the_silver_searcher
sudo pacman -S i3-wm i3status i3lock dmenu
sudo pacman -S htop
sudo pacman -S skype
sudo pacman -S mupdf

mkdir ~/builds

cd ~/builds || return
wget https://aur.archlinux.org/cgit/aur.git/snapshot/rcm.tar.gz
tar xf rcm.tar.gz && cd rcm || return
makepkg -sri

cd "$HOME" && rcup -x README.md -x screenshots

mkdir ~/.fonts
cd ~/.fonts || return
wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline.ttf
fc-cache -f

cd ~/builds || return
wget https://aur.archlinux.org/cgit/aur.git/snapshot/pam_ssh.tar.gz
tar xf pam_ssh.tar.gz && cd pam_ssh || return
makepkg -sri --skippgpcheck
mkdir ~/.ssh/login-keys.d && cd ~/.ssh/login-keys.d && ln -s ~/.ssh/id_rsa

# Now follow the instructions on https://wiki.archlinux.org/index.php/SSH_keys#pam_ssh

sudo pacman -S postgresql
sudo pacman -S inotify-tools
