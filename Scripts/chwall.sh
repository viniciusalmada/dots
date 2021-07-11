#!/usr/bin/env bash
filz=("$1"/*)
while true; do
	for img in "$1"/*; do
		im=`printf "%s\n" "${filz[RANDOM % ${#filz[@]}]}"`
		feh "$im" --bg-scale
		sleep 2m
	done
done

