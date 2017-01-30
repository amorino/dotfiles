source ~/code/antigen/antigen.zsh

local b="antigen-bundle"

# Guess what to install when running an unknown command.
$b command-not-found

# Helper for extracting different types of archives.
$b extract

# Tracks your most used directories, based on 'frecency'.
$b robbyrussell/oh-my-zsh plugins/z

# Syntax highlighting on the readline
$b zsh-users/zsh-syntax-highlighting

# history search
$b zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# suggestions
$b tarruda/zsh-autosuggestions

# colors for all files!
# $b trapd00r/zsh-syntax-highlighting-filetypes

# dont set a theme, because pure does it all
$b mafredri/zsh-async
$b sindresorhus/pure

# Tell antigen that you're done.
antigen apply

# Automatically list directory contents on `cd`.
auto-ls () {
	emulate -L zsh;
	# explicit sexy ls'ing as aliases arent honored in here.
	hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
}
chpwd_functions=( auto-ls $chpwd_functions )

# Load default dotfiles
source ~/.bash_profile