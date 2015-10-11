ZSH=$HOME/.oh-my-zsh
ZSH_THEME="phansch"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
DISABLE_CORRECTION="true"

plugins=(git gitfast phansch zsh-syntax-highlighting tmux)

ZSH_TMUX_AUTOSTART="true"

export EDITOR='vim'
export TERMINAL='urxvt'

# Disables gnome-keyring
unset GNOME_KEYRING_CONTROL

source $ZSH/oh-my-zsh.sh

# See http://robots.thoughtbot.com/cding-to-frequently-used-directories-in-zsh
setopt auto_cd
cdpath=($HOME $HOME/repos $HOME/code $HOME/.dotfiles $HOME/Documents)

stty -ixon
# Aliases
alias start_jekyll="jekyll serve --watch --drafts"

## Bundle
alias b="bundle"
alias "bundle up"="bundle install"

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
alias vi="vim"
alias top="htop"
alias apt="sudo apt-get"
alias install="sudo apt-get install"
alias touchpadon="synclient TouchpadOff=0"
alias touchpadoff="synclient TouchpadOff=1"
alias gnucash="LANG=de_DE.UTF8 gnucash"

## Switches for pairing
alias pair_dvorak="setxkbmap 'de(dvorak)'"
alias pair_de="setxkbmap 'de'"

## Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate"
alias m="migrate"
alias rk="rake"

## Git
alias gaa="git add --all"
alias gfa="git fetch --all"

# completion for tmuxinator
source ~/.bin/tmuxinator.zsh

push_to_staging() {
  local branch=`git rev-parse --symbolic-full-name --abbrev-ref HEAD`
  eval "git checkout staging && git pull && git merge $branch && git push && git checkout $branch"
}

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
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.bin:$HOME/.local/bin:/usr/local/bin/node:$HOME/android-sdk-linux/platform-tools

# added by travis gem
[ -f /home/philipp/.travis/travis.sh ] && source /home/philipp/.travis/travis.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
