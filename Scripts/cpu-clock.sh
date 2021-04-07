#!/usr/bin/env bash

CL=`lscpu | grep "CPU MHz" | awk {'print $3'}`
#TMP=`sensors | grep "Core 0" | awk {'print substr($3,2)'} `

OUT=`echo $CL | awk '{ printf "%4.0f MHz", $1  }'`

echo "&#xf2db; <span color='#fff'>$OUT</span>"
