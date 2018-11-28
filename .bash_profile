# Load our dotfiles like ~/.bash_prompt, etc…
# ~/.extra can be used for settings you don’t want to commit,
# Use it to configure your PATH, thus it being first in line.
for file in ~/.{bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# z beats cd most of the time. `brew install z`
# zpath="$(brew --prefix)/etc/profile.d/z.sh"
# [ -s $zpath ] && source $zpath


if [[ -n "$ZSH_VERSION" ]]; then  # quit now if in zsh
    return 1 2> /dev/null || exit 1;
fi;