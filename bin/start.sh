#!/bin/bash

script="$0"
FOLDER="$(pwd)/$(dirname $script)"

source $FOLDER/utils.sh
PROJECT_ROOT="$(abspath $FOLDER/..)"
echo "project root folder $PROJECT_ROOT"

########### Config ############

CONTAINER_NAME=local-mongo
DATA_FOLDER=$PROJECT_ROOT/data/db

##### Check if MongoDB is running #####

if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
  echo "MongoDB is running already..."
  exit 1
fi

########### Run MongoDB ############

docker run -dit \
           --name $CONTAINER_NAME \
           -v $DATA_FOLDER:/data/db \
           mongo:3.5.9
