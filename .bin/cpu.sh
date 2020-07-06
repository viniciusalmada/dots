#!/usr/bin/env bash

typeset -i CPU_CLOCK=`lscpu | grep 'CPU MHz' | awk '{printf("%1.0f",$3)}'`

# Full and short texts
echo "CPU Clock: $CPU_CLOCK"
echo "CPU: $CPU_CLOCK"

# Set urgent flag above 3000 or use orange above 2500
[ $CPU_CLOCK -ge 2500 ] && echo "#FF8000"
[ $CPU_CLOCK -ge 3000 ] && exit 33

exit 0
