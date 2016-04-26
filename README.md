## Installation

### System bootstrapping

Just run the following command:

    wget --no-check-certificate https://gitlab.com/phansch/dotfiles/raw/master/setup -O - | bash

This will:

1. Setup [Ansible](https://www.ansible.com/)
2. Upgrade and autoclean system packages
3. Clone the dotfiles (or pull if they exist already)
4. Run the [base playbook](https://gitlab.com/phansch/dotfiles/blob/master/ansible/playbooks/base.yml) to install the prerequisites
5. Run the [dotfiles playbook](https://gitlab.com/phansch/dotfiles/blob/master/ansible/playbooks/dotfiles.yml) to symlink the dotfiles
7. Print the command to run the optional playbooks

### Just the dotfiles

If you just want the dotfiles, clone them and use [rcm](https://github.com/thoughtbot/rcm) as below.
You will need to have [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) installed at `$HOME/.oh-my-zsh`.

    git clone https://gitlab.com/phansch/dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles
    git submodule foreach git pull origin master

    wget https://thoughtbot.github.io/rcm/debs/rcm_1.3.0-1_all.deb
    sha=$(sha256sum rcm_1.3.0-1_all.deb | cut -f1 -d' ')
    [ "$sha" = "2e95bbc23da4a0b995ec4757e0920197f4c92357214a65fedaf24274cda6806d" ] && \
    sudo dpkg -i rcm_1.3.0-1_all.deb

    cd $HOME && rcup -x README.md -x screenshots

## What's in there?

### zsh

* Custom zsh prompt/theme
* CTRL+Z to send jobs to background and to foreground

![zsh prompt](screenshots/screen-zsh1.png)

### X Config

**.xinitrc for i3**

Launches a couple of programs and the [i3](https://i3wm.org://i3wm.org/) window manager.

**.Xresources for urxvt configuration**

 * Gruvbox and Solarized themes
 * Clickable urls to launch firefox
 * Shortcuts to change the terminal font size
 * Font size management with Ctrl + arrow keys

### Git

 * Pre-defined commit message with suggestions

### Ruby

 * Basic rubocop.yml
 * irbrc - start pry if possible
 * gemrc - never download docs

### Scripts in bin/

 * `clean_rails` cleans cache and log files in rails projects

## Development

Since it can be a bit problematic to test changes to the configuration on the actual machine where you want to make them, there is a dev-setup script that will setup and start a VM with Linux Mint.

Currently it is only tested with Linux Mint XFCE, which you can get [here](https://linuxmint.com/edition.php?id=214)

Once downloaded, open a terminal and set `IMAGE_PATH` to the path where the .iso is located.

    IMAGE_PATH=$HOME/Downloads/linuxmint-17.3-xfce-64bit.iso

Then run the `dev-setup`:

    ./dev-setup

Now you'll have to go through the installation process of Linux Mint and then you're ready to install the dotfiles.
