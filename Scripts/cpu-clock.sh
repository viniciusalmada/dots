source $HOME/Scripts/env-functions.sh

CPU_CLOCK=$(get_cpu_clock)
CPU_MAX_CLOCK=$(get_cpu_max_clock)
PERC_CLOCK=`perl -E "say 100*$CPU_CLOCK/$CPU_MAX_CLOCK"`

if [[ $PERC_CLOCK -eq 100 ]]; then
	PERC_CLOCK=0
fi

OUT=`echo $PERC_CLOCK $CPU_CLOCK | \
	awk '{ printf "CPU %.2d%% %4.0f MHz", $1, $2 }'`

echo $(generate_pango_output "&#xf2db;" "$OUT")
