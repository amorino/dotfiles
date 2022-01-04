#!/bin/zsh
dir=$(pwd -P)
dotfiles=(bash zsh git)

print -P "%SRunning bootstrap script%s\n"

if ! (( $+commands[brew] )); then
    print -P "%F{red}Brew not installed%f\n"
    exit 0
fi

print -P "%SInstalling packages from brew%s\n"

brew bundle --no-upgrade

print -P "\n"

print -P "%SAdding symlinks for dotfiles%s\n"

for file in $dotfiles; do
    print -P "%F{green}Symlinking $file%f"
    stow -t ~/ $file
done

print -P "%SZSH as default %s\n"

chsh -s /bin/zsh

print -P "%SOSX configs%s\n"
sh ~/dotfiles/.osx