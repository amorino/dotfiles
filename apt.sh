#!/bin/bash

# Make sure we’re using the latest Homebrew
sudo apt update

sudo apt install curl
sudo apt install git
sudo apt install zsh
sudo apt install python3-pip
sudo apt install libpng-dev php-curl php-pgsql php-mbstring php-xml php-fpm
sudo apt install curl g++, gcc, autoconf, automake, bison, libc6-dev, libffi-dev, libgdbm-dev, libncurses5-dev, libsqlite3-dev, libtool, libyaml-dev, make, pkg-config, sqlite3, zlib1g-dev, libgmp-dev, libreadline-dev, libssl-dev

sudo -H pip3 install virtualenvwrapper