#!/bin/bash
bash ./apt.sh

# symlink it up!
bash ./symlink.sh
cd ..

# Install Z
wget https://raw.githubusercontent.com/rupa/z/master/z.sh

# Install node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

nvm install 8.11.1
nvm use 8.11.1

# Install Ruby
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable

# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install --no-install-recommends yarn

# Install antibody
curl -sL git.io/antibody | sh -s

# Install global npm
bash ./dotfiles/npm.sh

# Switch wo zsh
chsh -s `which zsh`

sudo shutdown -r 0