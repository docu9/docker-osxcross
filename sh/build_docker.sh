#!/bin/bash

OS=lxc
COIN=bho
if [  "$1"  ]; then
    OS=$1
fi

if [  "$2"  ]; then
    COIN=$2
fi

IMAGE=yangcoin/build_${OS}:1.2

docker run -it \
    --env  COIN=${COIN} \
    --env-file ${PWD}/env/docker_build_${OS}.env \
    --env-file ${PWD}/env/${COIN}.env \
    --volume ${PWD}/src:/src \
    --volume ${PWD}/sh:/sh \
    --volume ${PWD}/deploy:/deploy \
    --entrypoint /sh/build.sh  \
    ${IMAGE} 
