source $HOME/Scripts/env-functions.sh

IP=$(get_local_ip)

echo $(generate_pango_output "&#xf1eb;" "IP $IP")

