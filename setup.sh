# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install all the things
sh ./brew.sh

# symlink it up!
sh ./symlink.sh

sh ./brew-cask.sh

cd ~

# Install antibody
curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

# Install Poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

sh ./dotfiles/npm.sh

chsh -s /bin/zsh

sh ./dotfiles/.osx
