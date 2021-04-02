#!/usr/bin/env bash

# constants
NAME="Brightness"

# Unique id
msgId="12354"

current=`xbacklight`

dunstify -a $NAME -u low -r "$msgId" "Brightness level at ${current}"

