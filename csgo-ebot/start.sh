#!/bin/bash


echo "hostname 'eLeague CS:GO 5 v 5 Match Server #$SERVER_NUM'" > csgo/cfg/hostname.cfg 
echo '"STEAM_0:0:19457778" "@Full Admins"' > csgo/addons/sourcemod/configs/admins_simple.ini

./srcds_run -game csgo +sv_lan 1 -port $PORT +rcon_password $RCON_PASSWORD +map cs_office -maxplayers 12 -usercon -exec esl5on5.cfg -hostname "eLeague CS:GO 5 v 5 Match Server #$SERVER_NUM" +game_type 0 +game_mode 1 -tickrate 128 -maxplayers_override 10

