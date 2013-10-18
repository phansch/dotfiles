#!/bin/bash
# From https://github.com/thoughtbot/dotfiles/blob/master/install.sh
# Install dotfiles
#

dotfiles_backup="$HOME/.dotfiles_backup"
dotfiles="$HOME/.dotfiles"

function backup {

  # Create backup directory
  if [ ! -e "$dotfiles_backup" ]; then
    mkdir "$HOME/.dotfiles_backup"
  fi

  for file in *
  do
    if [ "$file" == 'bin' ]; then
      target="$HOME/bin"
    else
      target="$HOME/.${file##*/}"
    fi

    if [ -e "$target" ]; then
      echo -e "ALREADY_EXISTS: $target already exists."
      echo -e "-> Moving $target to $dotfiles_backup/$file \n"
      mv $target "$dotfiles_backup/$file"
    fi
  done
}

function setup_zsh {
  plugins=".oh-my-zsh/custom/plugins"

  echo -e "\nSetting up zsh custom config.."
  # Remove all existing custom plugins
  echo "Removing preinstalled custom plugins"
  rm -rf $HOME/.dotfiles/oh-my-zsh/custom/plugins/

  # symlink custom plugins dir
  echo "Creating $HOME/$plugins from $dotfiles/$plugins"
  ln -s "$HOME/.dotfiles/.oh-my-zsh/custom/plugins" "$HOME/.oh-my-zsh/custom"

  # symlink theme
  echo "Adding custom theme"
  ln -s "$HOME/.dotfiles/.oh-my-zsh/themes/phansch.zsh-theme" "$HOME/.oh-my-zsh/themes/phansch.zsh-theme"

  # Set the default shell to zsh if it isn't currently set to zsh
  if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
  fi
}


function setup {
  for file in *
  do
    echo "File: $file"
    # we have a custom zsh setup function, so skip the rest
    if [ "$file" == '.oh-my-zsh' ]; then
      continue
    fi

    if [ "$file" == 'bin' ]; then
      target="$HOME/bin"
    else
      target="$HOME/.${file##*/}"
    fi

    if [ ! -e "$target" ]; then
      if [ "$file" != 'install.sh' ] && [ "$file" != 'README.md' ]; then
        echo "Creating $target from $PWD/$file"
        ln -s "$PWD/$file" "$target"
      fi
    fi
  done
}

backup
setup
#setup_zsh