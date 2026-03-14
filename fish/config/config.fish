# Abbreviations
source ~/.config/fish/abbreviations.fish

# Aliases
source ~/.config/fish/aliases.fish

# 1Password
source ~/.config/op/plugins.sh

# Locale
set -x LANGUAGE "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x LANG "en_US.UTF-8"

# GPG
set -x GPG_TTY (tty)

# Starship
starship init fish | source

# Homebrew
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

function fish_greeting
    clear
end

function fish_title
end

# Homebrew
if test -d /usr/local/sbin
    fish_add_path "/usr/local/sbin"
end

# Local bin
fish_add_path "$HOME/.local/bin"

# Android
set -x ANDROID $HOME/Library/Android;
set -x ANDROID_HOME $ANDROID/sdk;
fish_add_path  $ANDROID_HOME/emulator  $ANDROID_HOME/platform-tools $ANDROID_HOME/tools/bin $ANDROID_HOME/tools

# Java
# set -x JAVA_HOME /Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
set -x JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# React
set -gx REACT_EDITOR cursor
set -gx EXPO_EDITOR "cursor"

# bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

# mise
mise activate fish | source

direnv hook fish | source
