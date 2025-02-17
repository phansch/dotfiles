export EDITOR='nvim'
export TERMINAL='ghostty'
export LESS="-i -R" # case-insensitive less search

autoload -U compinit
compinit

bindkey -e # emacs mode

# History
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
HISTFILE=~/.zsh/history
setopt hist_verify
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_ignore_dups
setopt inc_append_history
setopt share_history
setopt extended_history

# fuzzy find history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$key[Up]" up-line-or-beginning-search
bindkey "$key[Down]" down-line-or-beginning-search

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

## Git completion fix
zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'
zstyle ':completion:*:*' ignored-patterns '*pull/*'

# See http://robots.thoughtbot.com/cding-to-frequently-used-directories-in-zsh
setopt auto_cd
cdpath=($HOME $HOME/repos $HOME/code $HOME/code/rust $HOME/Documents)

stty -ixon

lazy_source () {
  eval "$1 () { [ -f $2 ] && source $2 && $1 \$@ }"
}

source ~/.zsh/prompt
source ~/.zsh/notifyosd.zsh
if [[ $(uname) == "Darwin" ]]; then
  source $(/opt/homebrew/bin/brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
source ~/.aliases
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"
clip() {
  cd ~/code/rust-clippy
}

ru() {
  cd ~/code/rust
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
export PATH=$PATH:/usr/local/sbin:$HOME/.bin:$HOME/.local/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export PATH="$PATH:/opt/nvim/"
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Local config
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.asdf/asdf.sh"

# tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
. "/home/phansch/.deno/env"
