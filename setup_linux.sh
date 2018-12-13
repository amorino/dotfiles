#!/bin/bash
bash ./apt.sh

# symlink it up!
bash ./symlink.sh
cd ..

# Install Z
wget https://raw.githubusercontent.com/rupa/z/master/z.sh

# Install node
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

nvm install 8.11.1
nvm use 8.11.1

# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install --no-install-recommends yarn

curl -sL git.io/antibody | sh -s

bash ./dotfiles/npm.sh

# Install ZSH
chsh -s `which zsh`

# sudo shutdown -r 0