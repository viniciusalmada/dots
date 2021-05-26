# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/Scripts:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
plugins=(
  git
  archlinux
  zsh-syntax-highlighting
  zsh-autosuggestions
  ssh-agent
  colored-man-pages
  command-not-found
  dirhistory
)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='nvim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias update="yay -Syu"
alias install="yay -S"
alias cat="bat"
alias ccat="/bin/cat"
alias adog="git log --all --decorate --oneline --graph"
alias tmp="cd /tmp"
alias vim="nvim"
alias v="nvim"
alias sv="sudo nvim"
alias pac="sudo pacman"
alias lsp="stat -c '%a %n' *"
alias lsh="stat -c '%a %n' .*"

alias pro="cd ~/Projects"
alias scr="cd ~/Scripts"

alias sz="source ~/.zshrc"

alias dots="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

alias ls="colorls --sd -A"

# Allow wildcard
setopt nonomatch
# Disable autocorrect
unsetopt correct_all

ufetch

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

precmd() { pwd > /tmp/whereami }
if [[ -f /tmp/whereami ]]; then
	cd "$(cat /tmp/whereami)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
