## Installation

    wget --no-check-certificate https://gitlab.com/phansch/dotfiles/raw/master/setup -O - | bash

## What's in there?
### oh-my-zsh

**Custom zsh prompt (aka zsh-theme) and syntax highlighting plugin**

![zsh prompt](screenshots/screen-zsh1.png)

### X Config

**.xinitrc for i3**

Launches a couple of programs and the [i3](https://i3wm.org://i3wm.org/) window manager.

**.Xresources for urxvt configuration**

 * Gruvbox and Solarized themes
 * Clickable urls to launch firefox
 * Shortcuts to change the terminal font size

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
