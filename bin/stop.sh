#!/bin/bash

########### Config ############

CONTAINER_NAME=local-mongo

##### Check if MongoDB is running #####

if [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
  echo "MongoDB is not running..."
  exit 1
fi

##### Stop and remove container #####

echo "Stopping container..."

docker stop $CONTAINER_NAME

echo "Removing container..."

docker rm $CONTAINER_NAME

echo "...done"
