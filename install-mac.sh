# Install programs with homebrew
./scripts/mac/homebrew.sh
# Install dev tools (npm, tmux, etc) not mac specific
./scripts/configure-dev.sh

cp ~/.zshrc ~/.zshrc.bak

# Link dotfiles
stow .
