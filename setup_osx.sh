# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install all the things
sh ./brew.sh
sh ./npm.sh

# github.com/rupa/z   - oh how i love you
# git clone https://github.com/rupa/z.git ~/code/z

# for the c alias (syntax highlighted cat)
sudo easy_install Pygments

sh .osx

# symlink it up!
sh ./symlink.sh
sh ./brew-cask.sh

chsh -s /bin/zsh