#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils

# Install wget with IRI support
brew install wget --with-iri

brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install ffmpeg
brew install yarn
brew install python3
brew install redis
brew install zlib
brew install postgres
brew install facebook/fb/idb-companion

brew install wifi-password

brew install zsh
brew install openssl
brew install mono
brew install z
brew install pyenv
brew install pyenv-virtualenv
brew install n
brew install carthage
brew install starship

# Remove outdated versions from the cellar
brew cleanup