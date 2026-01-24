# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'

alias chmox='chmod -x'

alias cask='brew cask'
alias where=which

alias hosts='sudo $EDITOR /etc/hosts'

alias ag='ag -f --hidden'

# ls with eza (modern replacement for ls)
if type -q eza
    alias ls='eza -F --group-directories-first'
    alias lsd='eza -lD'  # only directories
else if type -q gls
    alias ls='gls -AFh --color --group-directories-first'
    alias lsd='ls -l | grep "^d"'
else
    alias ls='ls -AFh -G'
    alias lsd='ls -l | grep "^d"'
end

# cat with beautiful colors
if type -q bat
    alias c='bat --style=plain'
else if type -q pygmentize
    alias c='pygmentize -O style=monokai -f console256 -g'
end

# Git aliases
alias push="git push"
alias undopush="git push -f origin HEAD^:master"
alias master="git checkout master"

# git root - cd to root of git repo
function gr
    set git_root (git rev-parse --show-cdup 2>/dev/null)
    if test -n "$git_root"
        cd $git_root
    end
end

# clone function - clone repo with depth 1 and install deps
function clone
    if test (count $argv) -eq 0
        echo "Usage: clone <git-url>"
        return 1
    end
    git clone --depth=1 $argv[1]
    set repo_name (basename $argv[1] .git)
    cd $repo_name
    if test -f package.json
        if type -q bun
            bun install
        else if type -q yarn
            yarn install
        else if type -q npm
            npm install
        end
    end
end

# Networking
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias wget="curl -O"

# Cleanup
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Disk space
alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"

# Shortcuts
alias v="vim"
alias ungz="gunzip -k"

# File size
alias fs="stat -f '%z bytes'"

# Empty the Trash
function emptytrash
    sudo rm -rfv /Volumes/*/.Trashes
    rm -rfv ~/.Trash/*
    sudo rm -v /private/var/vm/sleepimage
end

# Show colors
function showcolors
    for i in (seq 0 255)
        set_color -b (printf '%03d' $i)
        printf '  '
        set_color normal
        set_color (printf '%03d' $i)
        printf '%03d ' $i
        set_color normal
        if test (math "$i % 6") -eq 3
            echo
        end
    end
    echo
end

# Brew update
alias brew_update="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew doctor"
alias update_brew_npm_gem='brew_update; npm install npm -g; npm update -g'