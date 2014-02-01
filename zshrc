ZSH=$HOME/.oh-my-zsh
ZSH_THEME="phansch"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_CORRECTION="true"

plugins=(git phansch zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Aliases
alias git=hub
alias start_jekyll="jekyll serve --watch --drafts"

## Bundle
alias b="bundle"

## Unix
alias ...="cd ../.."
alias mkdir="mkdir -p"
alias ls="ls -h --color"
alias la="ls -A"
alias df="df -h"
alias vi="vim"
alias apt="sudo apt-get"
alias install="sudo apt-get install"

## Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate"
alias m="migrate"
alias rk="rake"


# Path stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## Customize to your needs...
export PATH=$PATH:/home/philipp/.rvm/gems/ruby-2.0.0-p247/bin:/home/philipp/.rvm/gems/ruby-2.0.0-p247@global/bin:/home/philipp/.rvm/rubies/ruby-2.0.0-p247/bin:/home/philipp/.rvm/bin:/home/philipp/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/philipp/.rvm/bin:/home/philipp/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# added by travis gem
[ -f /home/philipp/.travis/travis.sh ] && source /home/philipp/.travis/travis.sh
