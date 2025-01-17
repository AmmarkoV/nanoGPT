#!/usr/bin/env bash
# This script builds and runs a docker image for local use.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
cd ..
REPOSITORY=`pwd`

cd "$DIR"


NAME="nano-gpt"
dockerfile_pth="$DIR"
mount_pth="$REPOSITORY"

# update tensorflow image
docker pull tensorflow/tensorflow:latest-gpu

# build and run tensorflow
docker build \
	-t $NAME \
	$dockerfile_pth \
	--build-arg user_id=$UID

#-p 8080:8080 \
docker run -d \
	--gpus all \
	--shm-size 8G \
	-it \
	--name $NAME-container \
	-v $mount_pth:/home/user/workspace \
	$NAME


exit 0

#To Connect : 
#docker ps -a
#docker attach ID 
