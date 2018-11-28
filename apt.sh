#!/bin/bash

# Make sure we’re using the latest Homebrew
sudo apt-get update

sudo apt-get install curl
sudo apt-get install git
sudo apt-get install zsh
sudo apt-get install python3-pip
sudo -H pip3 install virtualenvwrapper

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install --no-install-recommends yarn

# Install node
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Install ZSH
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`