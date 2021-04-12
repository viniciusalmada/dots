#!/usr/bin/env bash

generate_pango_output() {
	echo \
		"<span \
			background='#ebdbb2' \
			foreground='$3'> $1 \
		</span> \
    <span \
			font_desc='Roboto Bold' \
			foreground='#282828' \
			background='$3'> $2\
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

generate_monitor() {
	ip_color="#ff241d"
	cpu_color="#98971a"
	ram_color="#d79921"
  stg_color="#458588"
  date_color="#689d6a"
  bat_color="#b16286"

	case "$1" in
		"IP")
			IP=$(get_local_ip)
			echo $(generate_pango_output "&#xf1eb; IP " "$IP" $ip_color)
      ;;
    "CPU")
			CPU_CLOCK=$(get_cpu_clock)
			CPU_MAX_CLOCK=$(get_cpu_max_clock)
			PERC_CLOCK=`perl -E "say 100*$CPU_CLOCK/$CPU_MAX_CLOCK"`
			if [[ $PERC_CLOCK -ge 100 ]]; then
				PERC_CLOCK=0
			fi
			OUT=`echo $PERC_CLOCK $CPU_CLOCK | \
				awk '{ printf " %.2d%% %4.0f MHz", $1, $2 }'`
			echo $(generate_pango_output "&#xf2db; CPU" "$OUT" $cpu_color)
			;;
		"RAM")
			USED=$(get_used_memory)
			TOTAL=$(get_total_memory)
			USED=`perl -E "say $USED/1024.0"`
			TOTAL=`perl -E "say $TOTAL/1024.0"`
			PERC=`perl -E "say 100*$USED/$TOTAL"`
			OUT=`echo $USED $PERC | \
				awk '{ printf "%1.1f%% %2.1f GB", $2, $1 }'`
			echo $(generate_pango_output "&#xf538; RAM" "$OUT" $ram_color)
			;;
    "STG")
      USED=$(get_used_disk)
      PERC=$(get_perc_used_disk)
      OUT=`echo $USED $PERC | \
	      awk '{ printf "%s %1.2f GB", $2, $1 }'`
      echo $(generate_pango_output "&#xf7c2; STG" "$OUT" $stg_color)
      ;;
    "DATE")
      D=`date '+%a %B %d, %I:%M %p'`
      echo $(generate_pango_output "&#xf073; DATE" "$D" $date_color)
      ;;
    "BAT")
      BAT=$(get_battery_level)
      if [[ "$BAT" == "0.0" ]]; then
        exit 1
      fi
      CHARGING=$(is_battery_charging)
      SIGNAL=""
      if [[ $CHARGING -eq 1 ]]; then
        SIGNAL="&#xf0e7;"
      fi
      BAT_ICON="&#xf244;"
      if [[ $BAT -ge 00 && $BAT -lt 15 ]]; then
        BAT_ICON="&#xf244;" # battery 0 to 15
      elif [[ $BAT -ge 15 && $BAT -lt 25 ]]; then
        BAT_ICON="&#xf243;" # battery 15 to 25
      elif [[ $BAT -ge 25 && $BAT -lt 50 ]]; then
        BAT_ICON="&#xf242;" # battery 25 to 50
      elif [[ $BAT -ge 50 && $BAT -lt 75 ]]; then
        BAT_ICON="&#xf241;" # battery 50 to 75
      else
        BAT_ICON="&#xf240;" # battery 75 to 100
      fi
      
      echo $(generate_pango_output "$BAT_ICON BAT" "$BAT% $SIGNAL" $bat_color) 
      ;;
		*)
			echo "Nothing"
			;;
	esac
}

generate_monitor "$1"
