##Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

source ~/dotfiles/dot-zshrc

brew bundle --file=~/dotfiles/scripts/mac/Brewfile
