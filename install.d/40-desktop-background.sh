#!/usr/bin/env bash

IMAGE_LOC="$dotfiles_wd/home-config/desktop-background.jpg"

if ["$OS" = "Darwin"]; then
  sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$IMAGE_LOC'";
  killall Dock;
fi
