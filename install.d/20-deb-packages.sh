#!/usr/bin/env bash

### Ubuntu/debian packages installation

## Upgrade current packages
apt update
apt upgrade -y

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

## Add Google key
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

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


## Add unofficial Go repo
## (needs to be tested)
# add-apt-repository -y ppa:gophers/archive
# apt install golang-1.9-go
# or
# snap install --classic go


# install packages
apt update
apt install -y python-dev python3-dev python-pip python3-pip pylint \
            vim \
            build-essential \
            libssl-dev libffi-dev \
            git \
            net-tools \
            sublime-text \
            code \
            terminator \
            cinnamon \
            gimp \
            google-chrome-stable \
            google-cloud-sdk \
            google-cloud-sdk-app-engine-python \
            google-cloud-sdk-app-engine-python-extras \
            google-cloud-sdk-app-engine-java \
            google-cloud-sdk-app-engine-go \
            google-cloud-sdk-datalab \
            google-cloud-sdk-datastore-emulator \
            google-cloud-sdk-pubsub-emulator \
            google-cloud-sdk-cbt \
            google-cloud-sdk-bigtable-emulator \
            kubectl \
            steam \
            vlc browser-plugin-vlc \
            google-drive-ocamlfuse


snap install --classic go



