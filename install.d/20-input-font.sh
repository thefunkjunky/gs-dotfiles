#!/usr/bin/env bash

OS="$(uname -s)"
if [ "$OS" = "Linux" ]; then
  sudo -u $dotfiles_usr mkdir $dotfiles_usr_home/.fonts
  sudo -u $dotfiles_usr cp -rf $dotfiles_wd/input-font/Input_Fonts $dotfiles_usr_home/.fonts/
fi

if [ "$OS" = "Darwin" ]; then
  sudo -u $dotfiles_usr cp -rf $dotfiles_wd/input-font/Input_Fonts $dotfiles_usr_home/Library/Fonts/
fi
