# Set Link for neovim
ln -s ~/.dotfiles/nvim ~/.config/

# Install Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Set Link for zsh
ln -s ~/.dotfiles/.zshrc ~

<<<<<<< HEAD
ln -s ~/.dotfiles/.gitconfig ~

=======
>>>>>>> ea1b70a4420ae9bfe37902e47dfa6a5938a56886
# Install global npm packages
npm install -g typescript
npm install -g nodemon
npm install -g neovim

# Add .gitignore to globalscope
git config --global core.excludesfile ~/.dotfiles/.gitignore
