ZSH=$HOME/.oh-my-zsh
ZSH_THEME="phansch"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
DISABLE_CORRECTION="true"

plugins=(git gitfast phansch zsh-syntax-highlighting)

export EDITOR='vim'
export TERMINAL='urxvt'

source $ZSH/oh-my-zsh.sh

# See http://robots.thoughtbot.com/cding-to-frequently-used-directories-in-zsh
setopt auto_cd
cdpath=($HOME $HOME/code $HOME/.dotfiles $HOME/Documents)

stty -ixon
# Aliases
alias start_jekyll="jekyll serve --watch --drafts"

## Bundle
alias b="bundle"
alias "bundle up"="bundle install"

## Unix
alias c=cd
alias ...="cd ../.."
alias mkdir="mkdir -p"
alias ls="ls -h --color"
alias la="ls -A"
alias df="df -h"
alias vi="vim"
alias top="htop"
alias apt="sudo apt-get"
alias install="sudo apt-get install"
alias touchpadon="synclient TouchpadOff=0"
alias touchpadoff="synclient TouchpadOff=1"

## Switches for pairing
alias pair_dvorak="setxkbmap 'de(dvorak)'"
alias pair_de="setxkbmap 'de'"

## Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate"
alias m="migrate"
alias rk="rake"

# completion for tmuxinator
source ~/.bin/tmuxinator.zsh

# Path stuff
PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting

## Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.bin

# added by travis gem
[ -f /home/philipp/.travis/travis.sh ] && source /home/philipp/.travis/travis.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
