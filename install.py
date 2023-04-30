import os
import platform

system = os.system
oper = platform.system()

npm = ['typescript', 'nodemon', 'neovim', 'prettier']

if oper == 'Darwin':
    system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
    macosPrograms = ['iterm2', 'neovim', 'node@18', 'ripgrep', 'lazygit'] 
    caskPrograms = ['font-roboto-mono-nerd-font', 'linearmouse', 'tunnelblick']

    for program in macosPrograms:
         system('brew install ' + program)

    system('brew tap homebrew/cask')
    system('brew tap homebrew/cask-fonts')
    
    for program in caskPrograms:
        system('brew install ' + program) 

if oper != 'Windows':
   system('ln -s ~/.dotfiles/.zshrc ~')
   system('ln -s ~/.dotfiles/.gitconfig ~')
   system('ln -s ~/.dotfiles/nvim ~/.config/nvim/config/')

system('git config --global core.excludesfile ~/.dotfiles/.gitignore')

system('git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim')

for item in npm:
    system('npm install -g ' + item)
