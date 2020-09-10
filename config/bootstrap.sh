#!/bin/sh

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'


# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

system_type=$(uname -s)

if [ "$system_type" = "Darwin" ]; then

   echo "Updating homebrew bundle: $DOTFILE_DIR"

   brew bundle --file=$DOTFILE_DIR/config/Brewfile

   stow -t ~/ -d $DOTFILE_DIR/dotfiles git

  source $DOTFILE_DIR/config/keygen.sh
  source $DOTFILE_DIR/config/npm/global.sh
  source $DOTFILE_DIR/config/macos/defaults.sh
  source $DOTFILE_DIR/config/git.sh


  echo "moving zshrc files"

  stow -t ~/ -d $DOTFILE_DIR/dotfiles zsh oh-my-zsh
  
  mkdir $DEV_DIR


fi
