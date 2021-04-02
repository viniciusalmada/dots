#!/usr/bin/env bash

if [[ -z "`pgrep -u $UID -x greenclip`" ]]; then
	greenclip daemon
fi

