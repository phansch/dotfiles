## Installation

    git clone git@github.com:phansch/dotfiles.git ~/.dotfiles && cd ~/.dotfiles
    git submodule update --init
    ./install.sh

Existing dotfiles will be moved to ~/.dotfiles_backup

## Updating

    cd ~/.dotfiles
    git pull
    git submodule update
    ./install.sh

## What's in there?
### oh-my-zsh

##### Custom zsh prompt (aka zsh-theme) and syntax highlighting plugin

![zsh prompt](screenshots/screen-zsh1.png)

##### Tab-completion plugin for ~ and ~/code/ directories
    c pha<tab> #c phansch.github.com/
    h .dot<tab> #h .dotfiles/

From https://github.com/ryanb/dotfiles but without rake and cap completion.
### X Config

##### .xinitrc for dwm
The script is pretty much self explanatory, but here's the gist:

 * Screen setup with xrandr
 * Launch a ton of programs:
   * redshift, [btsync](http://labs.bittorrent.com/experiments/sync.html), unclutter, emptytrash, feh, [bugwarrior-pull](https://github.com/ralphbean/bugwarrior)
   * [vlc ncurses with playlist](http://www.videolan.org/doc/play-howto/en/ch04.html#id590986)
   * Applets for dwm systray
   * And finally: [dwm](http://dwm.suckless.org/)

##### .Xresources for urxvt configuration
 * Solarized Dark and Solarized Light (default).
 * Clickable urls to launch firefox

![vlc ncurses](screenshots/screen-vlc.png)

### task
*.taskrc* remains pretty basic so far. We just set the .task data fodler to ~/.task/ and use the provided theme.

![task shell](screenshots/screen-task.png)

### Scripts in bin/
 
  * `emptytrash` clears the trash (/home/$USER/.local/share/Trash). 
  * `hub` adds github support to the git command
  * `routines` helps me stick to my routines in the morning

Here's a screenshot of the `routines` output:
![routines](screenshots/routines.png)
