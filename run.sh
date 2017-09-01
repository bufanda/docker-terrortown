#!/bin/bash
DATA=/home/docker/volumes/garrysmod


case "$1" in
	start)
		if [ -z "`docker ps -a | grep garrysmod`" ]; then
			docker run --name garrysmod -d -p 27015:27015 -p 27015:27015/udp -p 27005:27005/udp -p 27020:27020/udp -p 26900:26900/udp -v ${DATA}:/root/mounted gmserver
		else
			docker start garrysmod
		fi
	;;
	stop)
		docker stop garrysmod
	;;
	restart)
		docker restart garrysmod
	;;
	status)
		docker ps | grep garrysmod
	;;
	*)
		echo "Available options are [start|stop|restart|status]"
	;;
esac


