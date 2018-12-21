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
brew install imagemagick --with-webp
brew install ffmpeg --with-libvpx
brew install yarn --without-node
brew install python3

brew install wifi-password

brew install zsh
brew install openssl
brew install mono
brew install z

# Remove outdated versions from the cellar
brew cleanup