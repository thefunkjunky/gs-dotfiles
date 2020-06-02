#!/usr/bin/env bash

OS="$(uname -s)"
IMAGE_LOC="$dotfiles_wd/home-config/desktop-background.jpg"

# This doesn't work as of Mojave
# https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line/
# https://github.com/tech-otaku/macos-desktop/blob/master/README.md#limitations
# NOTE: The above approaches were not implemented here because they only work on single display/space

# if [ "$OS" = "Darwin" ]; then
#   sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$IMAGE_LOC'";
#   killall Dock;
# fi
