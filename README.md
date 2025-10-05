# .dotfiles

This is my dotfiles for my terminal dev environment

For now the install scripts are meant for macOS zsh homebrew environment

### Mac Install Guide

- XCode cmd tools (If on Mac)

```
xcode-select --install
```

- Clone Repo

```
git clone https://github.com/awhaston/dotfiles.git ~/dotfiles
```

- Install Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Verify Homebrew
```
brew doctor
brew --version
```

- Install Brewfile
```
brew bundle --file=<path to brewfile>
```

- Run install-mac.sh
```
./install-mac.sh
```

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
- Linux support
