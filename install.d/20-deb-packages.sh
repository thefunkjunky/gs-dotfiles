#!/usr/bin/env bash

set -x
### Ubuntu/debian packages installation

## Upgrade current packages
apt-get update
apt-get upgrade -y
apt-get install -y curl

## Add Sublime Text key/repo
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list

## Add Visual Studio Code key/repo
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

## Add Cinnamon desktop repo
add-apt-repository -y ppa:embrosyn/cinnamon

## Add Google chrome repo
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome-stable.list

## Install Google Cloud repo
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

## Add Gimp repo
add-apt-repository -y ppa:otto-kesselgulasch/gimp-edge

## Add Steam repo
add-apt-repository -y multiverse

## Add Google Drive OCamlFUSE repo
add-apt-repository -y ppa:alessandro-strada/ppa

## Add KeepPassXC repo
add-apt-repository -y ppa:phoerious/keepassxc


## Add unofficial Go repo
## (needs to be tested)
# add-apt-repository -y ppa:gophers/archive
# apt install golang-1.9-go
# or
# snap install --classic go

## Script to cleanup multiple repo configs. 
chmod +x $dotfiles_wd/apt-remove-duplicate-source-entries.py

## install packages
## NOTE: This runs through an array of package names to prevent
## apt-get from failing if one or more packages can't be found
declare -a apt_packages=(
  "python-dev"
  "python3-dev"
  "python-pip"
  "python3-pip"
  "pylint"
  "vim"
  "build-essential"
  "libssl-dev"
  "libffi-dev"
  "git"
  "net-tools"
  "sublime-text"
  "keepassxc"
  "code"
  "terminator"
  "cinnamon"
  "gimp"
  "google-chrome-stable"
  "google-cloud-sdk"
  "google-cloud-sdk-app-engine-python"
  "google-cloud-sdk-app-engine-python-extras"
  "google-cloud-sdk-app-engine-java"
  "google-cloud-sdk-app-engine-go"
  "google-cloud-sdk-datalab"
  "google-cloud-sdk-datastore-emulator"
  "google-cloud-sdk-pubsub-emulator"
  "google-cloud-sdk-cbt"
  "google-cloud-sdk-bigtable-emulator"
  "kubectl"
  "steam"
  "vlc"
  "browser-plugin-vlc"
  "google-drive-ocamlfuse"
  )
apt-get update
for pack in "${apt_packages[@]}"; do
  apt-get install -y $pack
done


## snap installs
snap install --classic go
