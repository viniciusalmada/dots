#!/usr/bin/env bash

# Terminate running picom 
killall -e picom

# Wait until the process have beem shut down
while pgrep -u $UID -x picom > /dev/null; do sleep 1; done

# Launch again
picom --experimental-backends -b
