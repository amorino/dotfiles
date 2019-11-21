# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install all the things
sh ./brew.sh


sh .osx

# symlink it up!
sh ./symlink.sh

sh ./brew-cask.sh

cd ~

# Node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer.phar

# Install Ruby
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable

# Install antibody
curl -sL git.io/antibody | sh -s

sh ./dofiles/npm.sh

chsh -s /bin/zsh

sh .osx