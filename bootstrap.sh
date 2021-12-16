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

if (( $+commands[antibody] )); then
    print -P "%F{yellow}antibody already installed%f\n"
else
    print -P "%F{green}Installing antibody%f\n"
    ruby -e "$(curl -sfL git.io/antibody | sh -s - -b /usr/local/bin)"
fi


if (( $+commands[poetry] )); then
    print -P "%F{yellow}Poetry already installed%f\n"
else
    print -P "%F{green}Installing Poeatry%f\n"
    ruby -e "$(curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python)"
fi

print -P "%SAdding symlinks for dotfiles%s\n"

for file in $dotfiles; do
    print -P "%F{green}Symlinking $file%f"
    stow -t ~/ $file
done

print -P "%SZSH as default %s\n"

chsh -s /bin/zsh

print -P "%SOSX configs%s\n"
sh ./dotfiles/.osx