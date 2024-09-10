#!/bin/bash

LOCAL_HOME="$HOME/.onDocker/bitcoin"
mkdir -p "$LOCAL_HOME" 2> /dev/null
mkdir -p "$LOCAL_WORKSPACE" 2> /dev/null

CONTAINER_NAME="bitcoin-on-docker"

OPTS=""
OPTS="${OPTS} --env=DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix"

xhost +local:root
docker run --rm -i --name="$CONTAINER_NAME" \
	${OPTS} \
	-v "$LOCAL_HOME:/App_Home" \
	lordrafa/bitcoin $@
xhost -local:root
