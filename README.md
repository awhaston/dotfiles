# .dotfiles

This is my dotfiles for my terminal dev environment

For now the install scripts are meant for macOS zsh homebrew environment

## Prereqs

- XCode cmd tools (If on Mac)

```
xcode-select --install
```

- Git
- Stow

### Install Guide

`git clone https://github.com/awhaston/dotfiles.git ~/dotfiles`  
Run .sh file that matches OS

### Apps Installed via homebrew

- Neovim
- stow
- node@18
- iterm2
- ripgrep
- Roboto-mono-nerd-font

### Problems with installing on Fedora

- Needed to install g++ for treesitter
- Had to manually install Roboto-mono-nerd-font

### TODO

- Add support for dnf
