# Sourcing to refresh paths
source ~/dotfiles/dot-zshrc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Make Project folder
mkdir ~/projects

# Install global npm packages
npm install -g typescript
npm install -g neovim

# Add .gitignore to globalscope
git config --global core.excludesfile ~/dotfiles/.gitignore
