source $HOME/Scripts/env-functions.sh

USED=$(get_used_memory)
TOTAL=$(get_total_memory)

# Convert to Gigabytes
USED=`perl -E "say $USED/1024.0"`
TOTAL=`perl -E "say $TOTAL/1024.0"`

PERC=`perl -E "say 100*$USED/$TOTAL"`

OUT=`echo $USED $PERC | \
	awk '{ printf "RAM %1.1f%% %2.1f GB", $2, $1 }'`

echo $(generate_pango_output "&#xf538;" "$OUT")
