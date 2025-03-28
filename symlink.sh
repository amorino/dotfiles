#!/bin/zsh
dir=$(pwd -P)
dotfiles=(bash zsh git tmux)

print -P "%SAdding symlinks for dotfiles%s\n"

for file in $dotfiles; do
    print -P "%F{green}Symlinking $file%f"
    stow -t ~/ $file
done