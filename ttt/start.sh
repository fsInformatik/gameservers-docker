#!/bin/bash

if [ -z $SERVER_TOKEN ]
then
   echo "Warning: No server token supplied" >&2
fi

[[ $LAN -ge 1 ]] && LAN="1" || LAN="0"

# Command line
[[ -n $MAP ]] &&  MAP="+map $MAP"
[[ -n $MAXPLAYERS ]] &&  MAXPLAYERS="+maxplayers $MAXPLAYERS"
[[ -n $SERVER_TOKEN ]] && SERVER_TOKEN="+sv_setsteamaccount $SERVER_TOKEN"
[[ -n $WORKSHOP_COLLECTION ]] && WORKSHOP_COLLECTION="+host_workshop_collection $WORKSHOP_COLLECTION"
[[ -n $AUTHKEY ]] && AUTHKEY="-authkey $AUTHKEY"
# Config file
[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="rcon_password $RCON_PASSWORD"
[[ -n $SV_PASSWORD ]] && SV_PASSWORD="sv_password $SV_PASSWORD"
[[ -z $SV_HOSTNAME ]] && SV_HOSTNAME="TTT - Server"


cat <<EOF >/steam/gmod/garrysmod/cfg/server.cfg

hostname "$SV_HOSTNAME"
$RCON_PASSWORD
$SV_PASSWORD
EOF

exec ./srcds_run -game garrysmod +gamemode terrortown -tickrate 128 +sv_lan $LAN -ip 0.0.0.0 $MAP $MAXPLAYERS -usercon $WORKSHOP_COLLECTION $AUTHKEY $OTHER_ARGS $@


#echo '"STEAM_0:0:19457778" "@Full Admins"' > csgo/addons/sourcemod/configs/admins_simple.ini


