#!/bin/bash

# to maintain cask ....
# brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`

# Install native apps

brew tap caskroom/cask

# utils
brew cask install spectacle
brew cask install dropbox
brew cask install alfred
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# dev
brew cask install iterm2
brew cask install visual-studio-code
brew cask install imagealpha
brew cask install imageoptim

# browsers
brew cask install chromium
brew cask install google-chrome firefox
brew cask install torbrowser

# misc
brew cask install vlc
brew cask install transmission
brew cask install telegram-desktop