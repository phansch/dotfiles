ZSH=$HOME/.oh-my-zsh
ZSH_THEME="phansch"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git phansch zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls="ls -h --color"
alias la="ls -A"
alias git=hub

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Customize to your needs...
export PATH=$PATH:/home/philipp/.rvm/gems/ruby-2.0.0-p247/bin:/home/philipp/.rvm/gems/ruby-2.0.0-p247@global/bin:/home/philipp/.rvm/rubies/ruby-2.0.0-p247/bin:/home/philipp/.rvm/bin:/home/philipp/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/philipp/.rvm/bin:/home/philipp/bin
