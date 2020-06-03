#!/usr/bin/env bash
# Ignore if we're not on OSX
[[ "$OSTYPE" =~ darwin* ]] || exit 0

defaults write com.apple.screencapture location $dotfiles_usr_home/Pictures/Screenshots
killall SystemUIServer
