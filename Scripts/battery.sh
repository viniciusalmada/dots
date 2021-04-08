source $HOME/Scripts/env-functions.sh

BAT=$(get_battery_level)

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

echo $(generate_pango_output "$BAT_ICON" "BAT $BAT% $SIGNAL") 
