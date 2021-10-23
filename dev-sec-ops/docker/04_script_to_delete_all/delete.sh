#!/bin/bash

stop_running_containers() {
  docker kill $(docker ps -aq)
}

delete_images() {
  docker rmi -f $(docker images -aq)
}

purge_all() {
  docker system prune -af
}


if [ -z $1 ]; then
  stop_running_containers
  delete_images
  purge_all
elif [ $1 == "c" ] || [ $1 == "containers" ]; then
  stop_running_containers
elif [ $1 == "i" ] || [ $1 == "images" ]; then
  delete_images
fi


