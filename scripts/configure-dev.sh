# Install Packer
# git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Make Project folder
mkdir ~/projects

# Install global npm packages
npm install -g typescript
npm install -g nodemon
npm install -g neovim
npm install -g pretttier

# Add .gitignore to globalscope
git config --global core.excludesfile ~/dotfiles/.gitignore
