export PATH=$PATH:~/.bin:~/bin
export EDITOR=/bin/nvim

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

