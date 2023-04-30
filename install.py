import os
import platform

system = os.system
oper = platform.system()

if oper == 'Darwin':
    system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
    macosPrograms = ['iterm2', 'neovim', 'node@18', 'ripgrep'] 
    caskPrograms = ['font-roboto-mono-nerd-font', 'linearmouse', 'tunnelblick']

    for program in macosPrograms:
         system('brew install ' + program)

    system('brew tap homebrew/cask')
    system('brew tap homebrew/cask-fonts')
    
    for program in caskPrograms:
        system('brew install ' + program) 
