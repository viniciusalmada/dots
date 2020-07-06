#!/bin/bash
yay -Qq > ~/.installed-pkgs && yay -Q > ~/.installed-pkgs-versions
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add  ~/.installed-pkgs  ~/.installed-pkgs-versions
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "$1"
