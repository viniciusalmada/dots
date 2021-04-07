#!/usr/bin/env bash

BKP_DIR=/mnt/bkp
RSYNC=`which rsync`
RFLAGS="--archive --update --compress --delete"


# Backup config files
mkdir -p $BKP_DIR/.config

# i3
echo "Checking i3 config..."
$RSYNC $RFLAGS ~/.config/i3 $BKP_DIR/.config
$RSYNC $RFLAGS ~/.config/i3blocks $BKP_DIR/.config
$RSYNC $RFLAGS ~/.config/i3status $BKP_DIR/.config

# alacritty
echo "Checking alacritty..."
$RSYNC $RFLAGS ~/.config/alacritty.yml $BKP_DIR/.config

# picom
echo "Checking picom..."
$RSYNC $RFLAGS ~/.config/picom/picom.conf $BKP_DIR/.config

# nvim
echo "Checking neovim..."
$RSYNC $RFLAGS --exclude 'plugged' ~/.config/nvim $BKP_DIR/.config

# neofetch
echo "Checking neofetch..."
$RSYNC $RFLAGS ~/.config/neofetch $BKP_DIR/.config

# ssh
echo "Checking ssh..."
$RSYNC $RFLAGS ~/.ssh $BKP_DIR

# git config
echo "Checking gitconf..."
$RSYNC $RFLAGS ~/.gitconfig $BKP_DIR

# Zsh and Oh my zsh
echo "Checking zsh and oh-my-zsh..."
$RSYNC $RFLAGS ~/.zshrc $BKP_DIR
$RSYNC $RFLAGS ~/.zsh_history $BKP_DIR
$RSYNC $RFLAGS ~/.oh-my-zsh $BKP_DIR

# Projects
echo "Checking projects folder..."
$RSYNC $RFLAGS --exclude-from=$HOME/Projects/exclude-rsync.txt ~/Projects $BKP_DIR

# Personal Files
echo "Checking personal files..."
$RSYNC $RFLAGS ~/Documents $BKP_DIR
$RSYNC $RFLAGS ~/Downloads $BKP_DIR
$RSYNC $RFLAGS ~/Pictures $BKP_DIR
$RSYNC $RFLAGS ~/Videos $BKP_DIR
$RSYNC $RFLAGS ~/Scripts $BKP_DIR

# Backup pacman installed packages
expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort > $BKP_DIR/packages.txt





