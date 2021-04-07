#!/usr/bin/env bash

USED=`df -h . | grep dev | awk '{ print $3 }'`
PERC=`df -h . | grep dev | awk '{ print $5 }'`

USED_G=`perl -E "say $USED/1024.0/1024.0"`

OUT=`echo $USED_G $PERC | awk '{ printf "%1.2f GB %s", $1, $2 }'`

echo "&#xf7c2; <span color='#fff'>$OUT</span>"
