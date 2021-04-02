#!/usr/bin/env bash

USED=`free --mega | grep "Mem:" | awk '{ print $3 }'`
TOTAL=`free --mega | grep "Mem:" | awk '{ print $2 }'`

# Convert to Gigabytes
USED=`perl -E "say $USED/1024.0"`
TOTAL=`perl -E "say $TOTAL/1024.0"`

PERC=`perl -E "say 100*$USED/$TOTAL"`

OUT=`echo $USED $PERC | awk '{ printf "%1.1f GB %1.1f%%", $1, $2 }'`

echo "&#xf538; <span color='#fff'>$OUT</span>"

#echo "$OUT"
#echo "$OUT"
#echo "#FFFFFF"
#echo "#282828"
