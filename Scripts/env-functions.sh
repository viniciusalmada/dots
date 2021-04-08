#!/usr/bin/env bash

generate_pango_output() {
	echo \
		"<span \
			background='#282828' \
			foreground='#83c07c'> $1 \
		</span><span \
			font_desc='Roboto' \
			background='#282828' \
			foreground='#83c07c'> $2\
		</span>"
}

get_local_ip() {
  IP=`ip route get 1.2.3.4 | awk '{print $7}'`
	echo $IP
}

get_cpu_clock() {
	CPU_CLOCK=`lscpu | grep "CPU MHz" | awk {'print $3'}`
	echo $CPU_CLOCK
}

get_cpu_max_clock() {
	CPU_MAX_CLOCK=`lscpu | grep "max" | awk {'print $4'}`
	echo $CPU_MAX_CLOCK
}

get_used_memory() {
  USED=`free --mega | grep "Mem:" | awk '{ print $3 }'`
	echo $USED
}

get_total_memory() {
  TOTAL=`free --mega | grep "Mem:" | awk '{ print $2 }'`
	echo $TOTAL
}

get_used_disk() {
	USED_KB=`df . | grep dev | awk '{ print $3 }'`
	USED_GB=`perl -E "say $USED_KB/1024.0/1024"`
	echo $USED_GB
}

get_perc_used_disk() {
	PERC=`df -h . | grep dev | awk '{ print $5 }'`
	echo $PERC
}

get_battery_level() {
	BAT_LVL=`cat /sys/class/power_supply/BAT0/energy_now`
	BAT_FULL=`cat /sys/class/power_supply/BAT0/energy_full`
	BAT_PERC=`perl -E "say $BAT_LVL/$BAT_FULL*100"`
	BAT=`echo $BAT_PERC | awk '{ printf "%2.1f", $1 }'`
	echo $BAT
}

is_battery_charging() {
	STATUS=`cat /sys/class/power_supply/BAT0/status`
	if [[ "$STATUS" == "Discharging" ]]; then
		echo 0
	else
		echo 1
	fi
}
