# Abbreviations
source ~/.config/fish/abbreviations.fish

# Locale
set -x LANGUAGE "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x LANG "en_US.UTF-8"

# Starship
starship init fish | source

# Homebrew
set -x HOMEBREW_NO_ANALYTICS 1

function fish_greeting
    clear
end

function fish_title
end

# Homebrew
if test -d /usr/local/sbin
    fish_add_path "/usr/local/sbin"
end

# Volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# JetBrains
fish_add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# Android
set -x ANDROID $HOME/Library/Android;
set -x ANDROID_HOME $ANDROID/sdk;
fish_add_path  $ANDROID_HOME/emulator  $ANDROID_HOME/platform-tools $ANDROID_HOME/tools/bin $ANDROID_HOME/tools

# Java
# set -x JAVA_HOME /Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
set -x JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# React
set -gx REACT_EDITOR pycharm

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
