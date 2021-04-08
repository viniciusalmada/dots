source $HOME/Scripts/env-functions.sh

USED=$(get_used_disk)
PERC=$(get_perc_used_disk)

OUT=`echo $USED $PERC | \
	awk '{ printf "STG %s %1.2f GB", $2, $1 }'`

echo $(generate_pango_output "&#xf7c2;" "$OUT")

