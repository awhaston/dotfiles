##Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install iTerm2
brew install --cask iterm2

# Install Neovim
brew install neovim

# Install Node Version 18
brew install node@18

# Install NerdFonts
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew install --cask font-roboto-mono-nerd-font

# Install Neovim
brew install neovim

# Install ripgrep for neovim
brew install ripgrep

# Install Node Version 18
brew install node@18

# Install NerdFonts
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew install --cask font-roboto-mono-nerd-font

# Install zsh-autocomplete
brew install zsh-autosuggestions

# Calling next script
~/install.sh
