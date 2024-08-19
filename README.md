[![Build Status](https://github.com/phansch/dotfiles/workflows/CI/badge.svg?branch=main)](https://github.com/phansch/dotfiles/actions)
[![Sponsor count](https://img.shields.io/badge/sponsors-4-brightgreen)](https://phansch.net/thanks)

## What's in there?

This is meant to be a 'minimal', **distraction free** setup. No fancy
statusbars, no crazy window decorations, no distractions.
With these dotfiles I want to automate as much as possible and keep UI clutter
to a minimum for a distraction-free environment.

The only exception for this is currently Neovim, where I'm using [LazyVim] to
set up everything. I had too many issues with my config breaking and I hope,
by 'outsourcing' it, it will break less often.

I **don't** recommend running the `setup` script on your machine unless
you understand what it does.  
I **do** recommend having a look through the various config files.
Below is a rough overview.

If you are interested in the CI setup, look [below](#ci-info).

### Window manager: i3

* i3bar is only shown when the modifier key is pressed
* i3bar only shows the workspaces, time and tray programs

### Terminal: Alacritty + tmux

Alacritty (vs. urxvt) improves various things for me:

* Much better HiDPI support
* Automatic config reloading (no more need for `xrdb -merge` and starting a new
  terminal
* Emoji support ✨

The tmux status display has no additional information apart from windows.

![tmux status display](screenshots/screen-tmux.png)

### Shell: zsh

* Custom zsh prompt/theme
* CTRL+Z to send jobs to background and to foreground
* No oh-my-zsh, because it makes things slow
* Same completion as oh-my-zsh

![zsh prompt](screenshots/screen-zsh1.png)

### Editor: Vim

* Using [LazyVim] for the core IDE setup
* Support for 'line' cursor shape in insert mode if using nvim
* Turns syntax off for large files
* Open the current file in browser (Useful for markdown)
* Return to the same line when you reopen a file
* Switch between tmux and vim panes using the same shortcuts

### Git

* Pre-defined commit message with suggestions

### Ruby

* Basic rubocop.yml
* irbrc - start pry if possible
* gemrc - never download docs

### Scripts in bin/

* `off` Will ask you to do a daily review, time tracking and if you are fine with your journaling and then suspend the machine.
* `clean_rails` cleans cache and log files in rails projects

## Installation

### System bootstrapping

Just run the following command:

    wget --no-check-certificate https://github.com/phansch/dotfiles/raw/main/setup -O - | bash -s -- -s

This will:

1. Setup [Ansible](https://www.ansible.com/)
2. Upgrade and autoclean system packages
3. Clone the dotfiles (or pull if they exist already)
4. Run the [base playbook](https://github.com/phansch/dotfiles/blob/main/ansible/playbooks/base.yml) to install the prerequisites
5. Run the [dotfiles playbook](https://github.com/phansch/dotfiles/blob/main/ansible/playbooks/dotfiles.yml) to symlink the dotfiles
6. Print the command to run the optional playbooks

### Just the dotfiles

If you just want the dotfiles, clone them and use [stow](https://www.gnu.org/software/stow/) as below.

    git clone https://github.com/phansch/dotfiles.git $HOME/.dotfiles

    cd $HOME

    # Install stow
    sudo apt-get install stow

    # To install the ruby dotfiles. Replace `ruby` with the stow package you want.
    # See ansible/playbooks/dotfiles.yml for a complete list of the stow packages.
    stow ruby --verbose=1 --target=$HOME/ --dir=$HOME/.dotfiles

### Environment variables

Some scripts, like the `off` script, use environment variables for configuration.
You can set these in your `~/.zshrc.local` which is sourced by `~/.zshrc` automatically.

The current environment variables are:

| Variable           | Function                                                      |
| ------------------ | ------------------------------------------------------------- |
| DAILY_REVIEW_LINK  | If set, opens the configured link when using the `off` script |
| WORK_TIME_TRACKING | If set, opens the configured link when using the `off` script |

## Development

Since it can be a bit problematic to test changes to the configuration on the actual machine where you want to make them, you can use Vagrant to test changes to the configuration.

You will need Vagrant and Virtualbox installed, then you can run:

    vagrant up

You can then either use `vagrant ssh` or connect to the VM through Virtualbox to have a GUI.

**Re-running a failed ansible playbook**

    ansible-playbook ansible/playbooks/<the-playbook>.yml

**Running the tests**

    run-parts test/

### CI Info

CI is trying to mirror a full Ubuntu installation in order to ensure the setup script doesn't fail.

All ansible playbooks are run on CI. The build will fail if:

* Any ansible playbook has not finished successfully
* i3 config is invalid
* vint detects mistakes in `init.vim`
* yaml-lint finds any issues
* `ansible-playbook --syntax-check` has not finished successfully
* shellcheck found errors

Have a look at the [`.travis.yml`][travis] and
[`Dockerfile`][dockerfile] to see how it works.

[travis]: https://github.com/phansch/dotfiles/blob/main/.travis.yml
[dockerfile]: https://github.com/phansch/dotfiles/blob/main/Dockerfile
[LazyVim]: http://www.lazyvim.org/
