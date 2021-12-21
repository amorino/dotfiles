#!/bin/zsh
dir=$(pwd -P)
dotfiles=(bash zsh git)

print -P "%SRunning bootstrap script%s\n"

if (( $+commands[brew] )); then
    print -P "%F{yellow}Brew already installed%f\n"
else
    print -P "%F{green}Installing brew%f\n"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

print -P "%SInstalling packages from brew%s\n"

brew bundle --no-upgrade

print -P "\n"

if [ -d ~/.zplugin/bin ]; then
    print -P "%F{yellow}Zplugin already installed%f\n"
else
    print -P "%F{green}Installing zplugin%f\n"
    mkdir ~/.zplugin
    git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
fi

print -P "%SAdding symlinks for dotfiles%s\n"

for file in $dotfiles; do
    print -P "%F{green}Symlinking $file%f"
    stow -t ~/ $file
done

print -P "%SZSH as default %s\n"

chsh -s /bin/zsh

print -P "%SOSX configs%s\n"
sh ~/dotfiles/.osx