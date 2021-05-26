#!/usr/bin/env bash
while true; do
	for img in "$1"/*; do
		feh "$img" --bg-fill
		sleep 5m
	done
done

