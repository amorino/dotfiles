# Enable autocompletions
autoload -Uz compinit

typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
zmodload -i zsh/complist

# Save history so we get auto suggestions
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
# Options
setopt auto_cd # cd by typing directory name if it's not a command
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances
setopt interactive_comments # allow comments in interactive shells
setopt autocd

# Improve autocompletion style
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

antidote bundle <~/.zsh_plugins.txt >~/.zsh_plugins.zsh
source ~/.zsh_plugins.zsh

eval "$(starship init zsh)"

# z beats cd most of the time. `brew install z`
zpath="$(brew --prefix)/etc/profile.d/z.sh"
[ -s $zpath ] && source $zpath

# Load our dotfiles like ~/.bash_prompt, etc…
# ~/.extra can be used for settings you don’t want to commit,
# Use it to configure your PATH, thus it being first in line.
for file in ~/.{bash_prompt,default_exports,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

source /Users/erickbazan/.docker/init-zsh.sh || true # Added by Docker Desktop
