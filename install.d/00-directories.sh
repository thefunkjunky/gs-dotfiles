#!/usr/bin/env bash

# Create home directories and copy files
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/Downloads/Torrents/Incomplete
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/Downloads/Torrents/Complete
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/Downloads/Chrome
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/Downloads/Firefox
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/Documents/Personal/Development
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/Documents/Saved-Websites
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/Documents/Professional
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/Dropbox
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/gitclones
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/mounts
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/bin
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/Google-Drive
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/Projects/Music
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/Projects/Coding
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/Go/src
sudo -u $dotfiles_usr mkdir -p $dotfiles_usr_home/.shellrc
sudo -u $dotfiles_usr cp  $dotfiles_wd/home-config/.bashrc $dotfiles_usr_home/.bashrc
sudo -u $dotfiles_usr cp  $dotfiles_wd/home-config/.bash_profile $dotfiles_usr_home/.bash_profile
sudo -u $dotfiles_usr cp -rf $dotfiles_wd/home-config/bashrc.d $dotfiles_usr_home/.shellrc/
sudo -u $dotfiles_usr cp $dotfiles_wd/.vimrc $dotfiles_usr_home/.vimrc
sudo -u $dotfiles_usr cp $dotfiles_wd/.pylintrc $dotfiles_usr_home/.pylintrc
