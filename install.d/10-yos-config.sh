#!/usr/bin/env bash
# Ignore if we're not on OSX
[[ "$OSTYPE" =~ darwin* ]] || exit 0


# A lot of these have been stolen from various guides
# notable guides:
# - https://github.com/mathiasbynens/dotfiles/blob/master/.osx

###############################################################################
# UI/UX                                                                       #
###############################################################################

# Expand save panel by default
sudo -u $dotfiles_usr defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
sudo -u $dotfiles_usr defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
sudo -u $dotfiles_usr defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
sudo -u $dotfiles_usr defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
sudo -u $dotfiles_usr defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
sudo -u $dotfiles_usr defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
sudo -u $dotfiles_usr defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable Resume system-wide
sudo -u $dotfiles_usr defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
sudo -u $dotfiles_usr defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable the crash reporter
sudo -u $dotfiles_usr defaults write com.apple.CrashReporter DialogType -string "none"

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Increase window resize speed for Cocoa applications
sudo -u $dotfiles_usr defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Disable local Time Machine snapshots
sudo tmutil disablelocal

# Require password for login
sudo -u $dotfiles_usr defaults write com.apple.screensaver askForPassword -int 1
sudo -u $dotfiles_usr defaults write com.apple.screensaver askForPasswordDelay -int 0

# Never go into computer sleep mode
sudo systemsetup -setcomputersleep Off > /dev/null

# Check for software updates daily, not just once per week
sudo -u $dotfiles_usr defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable auto-arrange Spaces
sudo -u $dotfiles_usr defaults write com.apple.dock mru-spaces -bool false
