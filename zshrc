export EDITOR='vim'
export TERMINAL='urxvt'

autoload -U compinit
compinit

bindkey -e # emacs mode

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh/history
setopt hist_verify
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt extended_history

# fuzzy find history
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# Completion
setopt auto_menu
setopt complete_in_word
setopt always_to_end

## enable menu completion
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion::complete:*' use-cache 1

## case-insensitive
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# See http://robots.thoughtbot.com/cding-to-frequently-used-directories-in-zsh
setopt auto_cd
cdpath=($HOME $HOME/repos $HOME/code $HOME/.dotfiles $HOME/Documents)

stty -ixon

lazy_source () {
  eval "$1 () { [ -f $2 ] && source $2 && $1 \$@ }"
}

source ~/.zsh/prompt
source ~/.aliases

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
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$HOME/.bin:$HOME/.local/bin

lazy_source rvm "$HOME/.rvm/scripts/rvm"

# Local config
if [[ -e ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

export NVM_DIR="$HOME/.nvm"
lazy_source nvm "$NVM_DIR/nvm.sh" # This loads nvm
