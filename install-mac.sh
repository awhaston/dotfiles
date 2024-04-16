# Install programs with homebrew
./scripts/mac/homebrew.sh
# Install dev tools (npm, tmux, etc) not mac specific
./scripts/configure-dev.sh

# Sourcing to refresh paths
source ~/dotfiles/.zshrc

cp ~/.zshrc ~/.zshrc.bak
cp ~/.gitconfig ~/.gitconfig.bak

# Link dotfiles
stow .
