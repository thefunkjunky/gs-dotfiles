#!/usr/bin/env bash
# Ignore if we're not on OSX
[[ "$OSTYPE" =~ darwin* ]] || exit 0

###############################################################################
# Finder                                                                      #
###############################################################################
# Finder: show all filename extensions
sudo -u $dotfiles_usr defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
sudo -u $dotfiles_usr defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
sudo -u $dotfiles_usr defaults write com.apple.finder ShowPathbar -bool true

# Finder: allow text selection in Quick Look
sudo -u $dotfiles_usr defaults write com.apple.finder QLEnableTextSelection -bool true

# Display full POSIX path as Finder window title
sudo -u $dotfiles_usr defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
sudo -u $dotfiles_usr defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
sudo -u $dotfiles_usr defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder: show hidden files by default
sudo -u $dotfiles_usr defaults write com.apple.finder AppleShowAllFiles -bool true

# Avoid creating .DS_Store files on network volumes
sudo -u $dotfiles_usr defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Automatically open a new Finder window when a volume is mounted
sudo -u $dotfiles_usr defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
sudo -u $dotfiles_usr defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
sudo -u $dotfiles_usr defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Disable the warning before emptying the Trash
sudo -u $dotfiles_usr defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Empty Trash securely by default
sudo -u $dotfiles_usr defaults write com.apple.finder EmptyTrashSecurely -bool true
