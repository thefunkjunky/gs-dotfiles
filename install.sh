#!/usr/bin/env bash

# Verbose output, including commands being run
set -x

## Personal set-up scripts for Ubuntu Linux and OSX
## Heavily inspired (*ahem* copied) by https://github.com/Juxtaposedwords/dotfiles

## https://unix.stackexchange.com/questions/190571/sudo-in-non-interactive-script
## for idea on how to run sudo in script


## Detect the user who launched the script and save relevant info.
## (this might not actually be necessary)
export dotfiles_usr=$(env | grep SUDO_USER | cut -d= -f 2)
export dotfiles_usr_home=$(sudo -u $dotfiles_usr echo $HOME)
export dotfiles_wd=$(sudo -u $dotfiles_usr pwd)

## Exit if the script was not launched by root or through sudo
if [ "$EUID" -ne 0 ]
then
    echo "The script needs to run as root" && exit 1
fi

## Execute each dotfiles script
for file in $dotfiles_wd/install.d/*.sh; do
  chmod +x $file
  bash $file
done

## remove env variables
unset dotfiles_usr
unset dotfiles_usr_home
unset dotfiles_wd

## Set back to non-verbose output
set +x
