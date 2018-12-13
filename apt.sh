#!/bin/bash

# Make sure we’re using the latest Homebrew
sudo apt update

sudo apt install curl
sudo apt install git
sudo apt install zsh
sudo apt install python3-pip
sudo apt install libpng-dev php-curl php-pgsql php-mbstring php-xml php-fpm

sudo -H pip3 install virtualenvwrapper