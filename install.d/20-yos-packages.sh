#!/bin/bash
# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
 while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# make sure we have xcode...homebrew requires
if test ! $(which brew); then
   echo "Installing homebrew..."
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Ask for the administrator password upfront.
sudo -v

sudo -u $dotfiles_usr brew doctor

# Setup Homebrew Cask.
sudo -u $dotfiles_usr brew tap caskroom/cask
sudo -u $dotfiles_usr brew install brew-cask
sudo -u $dotfiles_usr brew tap caskroom/versions
sudo -u $dotfiles_usr brew tap homebrew/dupes
sudo -u $dotfiles_usr brew tap homebrew/versions
sudo -u $dotfiles_usr brew tap homebrew/services
sudo -u $dotfiles_usr brew update
sudo -u $dotfiles_usr brew upgrade brew-cask
sudo -u $dotfiles_usr brew cleanup
sudo -u $dotfiles_usr brew cask cleanup

# Install more recent versions of some OS X tools

sudo -u $dotfiles_usr brew tap homebrew/dupes



# Upgrade any already-installed formulae.
sudo -u $dotfiles_usr brew upgrade

# Make sure we’re using the latest Homebrew.
sudo -u $dotfiles_usr brew update

# Let's get the latest bash
sudo -u $dotfiles_usr brew install bash
sudo -u $dotfiles_usr brew install bash-completion2


# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
sudo -u $dotfiles_usr brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
sudo -u $dotfiles_usr brew install findutils --with-default-names

# Install more recent versions of some OS X tools and #JustSysAdminThings
sudo -u $dotfiles_usr brew install vim --override-system-vi
sudo -u $dotfiles_usr brew install gnu-indent --with-default-names
sudo -u $dotfiles_usr brew install gnu-sed --with-default-names
sudo -u $dotfiles_usr brew install gnutls --with-default-names
sudo -u $dotfiles_usr brew install gnu-tar --with-default-names
sudo -u $dotfiles_usr brew install gnu-which --with-default-names
sudo -u $dotfiles_usr brew install grep --with-defualt-names
sudo -u $dotfiles_usr brew install gawk
sudo -u $dotfiles_usr brew install tree
sudo -u $dotfiles_usr brew install htop
sudo -u $dotfiles_usr brew install git
sudo -u $dotfiles_usr brew install wget

# Install some recreational stuff
sudo -u $dotfiles_usr brew install terminal-notifier
sudo -u $dotfiles_usr brew install pianobar

# This will install all the stuff we need for reasons
sudo -u $dotfiles_usr brew cask install google-chrome
sudo -u $dotfiles_usr brew cask install google-chrome-canary
sudo -u $dotfiles_usr brew cask install dropbox
sudo -u $dotfiles_usr brew cask install shiftit
sudo -u $dotfiles_usr brew cask install viscosity
sudo -u $dotfiles_usr brew cask install alfred
sudo -u $dotfiles_usr brew cask install google-drive
sudo -u $dotfiles_usr brew cask install skype
sudo -u $dotfiles_usr brew cask install transmission
sudo -u $dotfiles_usr brew cask install firefox-aurora
sudo -u $dotfiles_usr brew cask install sublime-text3
sudo -u $dotfiles_usr brew cask install keepassx
sudo -u $dotfiles_usr brew cask install caskroom/homebrew-versions/java6
sudo -u $dotfiles_usr brew cask install pycharm
sudo -u $dotfiles_usr brew cask install slack
sudo -u $dotfiles_usr brew cask install xquartz
sudo -u $dotfiles_usr brew cask install wireshark
sudo -u $dotfiles_usr brew cask install adobe-reader
sudo -u $dotfiles_usr brew cask install texshop
sudo -u $dotfiles_usr brew cask install calibre
sudo -u $dotfiles_usr brew cask install silverlight
sudo -u $dotfiles_usr brew cask install vlc

# Docker...no seriously
sudo -u $dotfiles_usr brew cask install vmware-fusion7
sudo -u $dotfiles_usr brew install docker
sudo -u $dotfiles_usr brew install docker-machine
sudo -u $dotfiles_usr brew cask install docker

# Work stuff
sudo -u $dotfiles_usr brew install net-snmp
sudo -u $dotfiles_usr brew cask install apache-directory-studio
sudo -u $dotfiles_usr brew cask install wireshark
sudo -u $dotfiles_usr brew update
sudo -u $dotfiles_usr brew tap jawshooah/nodenv
sudo -u $dotfiles_usr brew install jawshooah/nodenv/nodenv
sudo -u $dotfiles_usr brew install --HEAD node-build


# Remove outdated versions from the cellar.
sudo -u $dotfiles_usr brew cleanup


LOCALBASH="/usr/local/bin/bash"
if ! grep -q $LOCALBASH /etc/shells; then
  echo $LOCALBASH | sudo tee -a /etc/shells
  sudo chsh -s $LOCALBASH $USER
fi

# Move /usr/local/bin to the top of the path
sudo sed -ie  '/^\/usr\/local\/bin/!H;//p;$!d;g;s/\n//' /etc/paths
