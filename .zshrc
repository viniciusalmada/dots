# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.cargo/env:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Oh my Zsh theme 
ZSH_THEME="pmcgee"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load?
plugins=(
	git
	debian
)

source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env

# User configuration

export EDITOR='vim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias update="sudo apt autoremove -y && sudo apt update && sudo apt upgrade -y"
alias install="sudo apt install"
alias search="sudo apt search"

alias please="sudo"
alias fixapt="sudo apt install -f"
alias cat="batcat"
alias ccat="/bin/cat"
alias adog="git log --all --decorate --oneline --graph"
alias tmp="cd /tmp"

# Allow wildcard
setopt nonomatch

neofetch
