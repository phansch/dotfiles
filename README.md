## Installation

    git clone git@github.com:phansch/dotfiles.git ~/.dotfiles && cd ~/.dotfiles
    ./install.sh

Existing dotfiles will be moved to ~/.dotfiles_backup

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
   * productivity suite ([pal](http://palcal.sourceforge.net/), [task](http://taskwarrior.org/projects/show/taskwarrior), [mutt](http://www.mutt.org/), sublime-text-3)
   * And finally: [dwm](http://dwm.suckless.org/)

##### .Xresources for urxvt configuration
 * Solarized Dark and Solarized Light (default).
 * Clickable urls to launch firefox


### mutt & task
*.muttrc* contains a config for using Gmail with mutt.
Extra shortcuts are:

    y # Gmail Archive message
    d # Gmail delete message
    gi # Go to inbox
    ga # Go to all mail
    gs # Go to starred messages
    gd # Go to drafts

*.taskrc* remains pretty basic so far. We just set the .task data fodler to ~/.task/ and use the provided theme.

