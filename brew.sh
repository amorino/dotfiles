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
brew install node # This installs `npm` too using the recommended installation method
brew install ffmpeg --with-libvpx
brew install yarn

brew install wifi-password

brew install zsh

# Remove outdated versions from the cellar
brew cleanup