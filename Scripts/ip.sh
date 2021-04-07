#!/usr/bin/env bash

IP=`ip route get 1.2.3.4 | awk '{print $7}'`

echo "&#xf1eb; <span color='#fff'>$IP</span>"

