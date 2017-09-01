#!/bin/bash
CONFIG="-v ./configs/server.cfg:/opt/steam/garrysmod/cfg/server.cfg:ro"
AUTOEXEC="-v ./configs/autoexec.cfg:/opt/steam/garrysmod/cfg/autoexec.cfg:ro"
PORTS="-p 27015:27015 -p 27015:27015/udp -p 27005:27005/udp -p 27020:27020/udp -p 26900:26900/udp"
NAME=terrortown
ENV="-e ENV_DOCKER_WORKSHOP_COLLECTION= -e ENV_DOCKER_STEAM_ACC_KEY=  -e ENV_DOCKER_STEAM_AUTH_KEY="
ENVPORT="-e ENV_DOCKER_TTT_PORT=27015"

case "$1" in
	start)
		if [ -z "`docker ps -a | grep ${NAME}`" ]; then
			docker run --name ${NAME} -d ${PORTS} ${ENV} ${ENVPORT} ${AUTOEXEC} ${CONFIG} bufanda/terrortown
		else
			docker start ${NAME}
		fi
	;;
	stop)
		docker stop ${NAME}
	;;
	restart)
		docker restart ${NAME}
	;;
	status)
		docker ps | grep ${NAME}
	;;
	*)
		echo "Available options are [start|stop|restart|status]"
	;;
esac
