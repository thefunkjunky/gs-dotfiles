#!/usr/bin/env bash

OS="$(uname -s)"
DOTF_ST3_USER_LOC="$dotfiles_wd/home-config/sublime-text/User"
LINUX_SB3_PKG_LOC="$dotfiles_usr_home/.config/sublime-text-3/Packages/"
OSX_SB3_PKG_LOC="$dotfiles_usr_home/Library/Application\ Support/Sublime\ Text\ 3/Packages/"

if [ "$OS" = "Linux" ]; then
  sudo -u $dotfiles_usr cp -rf $DOTF_ST3_USER_LOC $LINUX_SB3_PKG_LOC
fi

if [ "$OS" = "Darwin" ]; then
  echo $DOTF_ST3_USER_LOC
  echo $OSX_SB3_PKG_LOC
  sudo -u $dotfiles_usr cp -f $DOTF_ST3_USER_LOC $OSX_SB3_PKG_LOC
fi
