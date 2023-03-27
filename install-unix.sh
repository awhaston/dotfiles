#Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Neovim
brew install neovim


#Set Link for neovim
ln -s ~/.dotfiles/nvim ~/.config/

# Set Link for zsh
ln -s ~/.dotfiles/.zshrc ~
