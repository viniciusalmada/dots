#!/usr/bin/env bash
# change volume

# constants
NAME="Volume"

# Unique id
msgId="1235"

vol=`pamixer --get-volume`
mute=`pamixer --get-mute`

if [[ $vol == 0 || "$mute" == "true" ]]; then
	dunstify -a $NAME -u low -r "$msgId" "Volume muted"
else
	dunstify -a $NAME -u low -r "$msgId" "Volume: ${vol}%"
fi
