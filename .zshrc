# Paths
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
export PATH=$PATH:/Users/wyatthaston/.dotnet/tools
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
export DOTNET_ROOT="$PATH:/opt/homebrew/opt/dotnet/libexec"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/bin"

# Prompt
PS1="%n@%m %~ %# "

# Aliases
alias -g v="nvim"
alias -g g="git"
alias -g gc="git commit"
alias -g gs="git status"
alias -g gwta="git worktree add"
alias -g ga="git add"
alias projects="cd ~/git"
alias dotfiles="cd ~/dotfiles"
alias ll="ls -al"
alias -g lg="lazygit"

alias sa='source ~/.zshrc;echo "ZSH aliases sourced."'

##########################################################

fastfetch
