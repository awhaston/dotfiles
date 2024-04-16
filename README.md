# .dotfiles

This is my dotfiles for my terminal dev environment

For now the install scripts are meant for macOS zsh homebrew environment

## Prereqs

XCode cmd tools (If on Mac)
```
xcode-select --install
```
Git
Stow

### Install Guide

`git clone https://github.com/awhaston/.dotfiles.git ~/dotfiles`  
If using homebrew run homebrew.sh (this will run install.sh)  
else use install.sh  
Install.sh set all symbolic links and install required npm packages

### Apps Installed via homebrew

- Neovim
- node@18
- iterm2
- ripgrep
- Roboto-mono-nerd-font

### Problems with installing on Fedora

- Needed to install g++ for treesitter
- Had to manually install Roboto-mono-nerd-font

### TODO

- Add support for dnf
