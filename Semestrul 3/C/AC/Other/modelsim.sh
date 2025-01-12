#!/usr/bin/env bash

MODELSIM_WORKPLACE=$HOME/Documents/msim
mkdir -p $MODELSIM_WORKPLACE
echo The shared folder is: MODELSIM_WORKPLACE=$MODELSIM_WORKPLACE
xhost +localhost
docker run -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) --net=host -e DISPLAY=host.docker.internal:0 --volume="$MODELSIM_WORKPLACE:/home/eda/shared" --rm -it modelsim:6.5
