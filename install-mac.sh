#Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Neovim
brew install neovim

# Install Node Version 18
brew install node@18

# Install NerdFonts
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew install font-roboto-mono-nerd-font

#Set Link for neovim
ln -s ~/.dotfiles/nvim ~/.config/

# Set Link for zsh
ln -s ~/.dotfiles/.zshrc ~
