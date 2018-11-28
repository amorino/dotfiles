#!/bin/bash

bash ./apt.sh

# symlink it up!
bash ./symlink.sh
cd ..

#Install Z
wget https://raw.githubusercontent.com/rupa/z/master/z.sh

curl -sL git.io/antibody | sh -s

source ~/.zshrc

nvm install 8.11.1
nvm use 8.11.1

bash ./dotfiles/npm.sh

# sudo shutdown -r 0