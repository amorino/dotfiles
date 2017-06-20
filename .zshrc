source <(antibody init)

# dont set a theme, because pure does it all
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
antibody bundle zsh-users/zsh-syntax-highlighting

# Automatically list directory contents on `cd`.
auto-ls () {
	emulate -L zsh;
	# explicit sexy ls'ing as aliases arent honored in here.
	hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
}
chpwd_functions=( auto-ls $chpwd_functions )

export PATH="/usr/local/sbin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Load default dotfiles
source ~/.bash_profile