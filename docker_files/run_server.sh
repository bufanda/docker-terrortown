#!/bin/sh
cd /opt/steam
# Fixes [S_API FAIL] SteamAPI_Init() failed; unable to locate a running instance of Steam, or a local steamclient.dll.
export HOME="/root"
file="/root/.steam/sdk32/steamclient.so"
if ! [ -f "$file" ]
then
	mkdir -p ~/.steam/sdk32/
	ln -s /etc/service/steamcmd/linux32/steamclient.so "$file"
fi

exec ./srcds_run +sv_setsteamaccount ${ENV_DOCKER_STEAM_ACC_KEY} -port 27015 -console -maxplayers 16 -game garrysmod +gamemode terrortown +map ttt_bb_teenroom_b2 +ip 0.0.0.0 -authkey ${ENV_DOCKER_STEAM_AUTH_KEY} +host_workshop_collection ${ENV_DOCKER_WORKSHOP_COLLECTION}
