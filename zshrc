ZSH=$HOME/.oh-my-zsh
ZSH_THEME="phansch"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
DISABLE_CORRECTION="true"

plugins=(git gitfast phansch tmux zsh-syntax-highlighting)

ZSH_TMUX_AUTOSTART="true"

export EDITOR='vim'
export TERMINAL='urxvt'

source $ZSH/oh-my-zsh.sh

# See http://robots.thoughtbot.com/cding-to-frequently-used-directories-in-zsh
setopt auto_cd
cdpath=($HOME $HOME/repos $HOME/code $HOME/.dotfiles $HOME/Documents)

stty -ixon

# Aliases

## Unix
alias c=cd
alias v=vim
alias ...="cd ../.."
alias mkdir="mkdir -p"
alias grep="grep --color=auto"
alias ping="ping -c 5"
alias ls="ls -h --color"
alias la="ls -A"
alias df="df -h"
alias top="htop"
alias apt="sudo apt-get"
alias install="sudo apt-get install"

## Switches for pairing
alias pair_dvorak="setxkbmap 'de(dvorak)'"
alias pair_de="setxkbmap 'de'"

## Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate"
alias m="migrate"

## Git
alias gaa="git add --all"
alias gfa="git fetch --all"
alias gcp="git cherry-pick"

# completion for tmuxinator
source ~/.bin/tmuxinator.zsh

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Path stuff
PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting

## Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$HOME/.bin:$HOME/.local/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Local config
if [[ -e ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi
