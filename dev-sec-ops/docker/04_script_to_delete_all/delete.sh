#!/bin/bash

stop_running_containers() {
  docker kill $(docker ps -aq)
}

delete_images() {
  docker rmi -f $(docker images -aq)
}

delete_volumes() {
  docker volume rm $(docker volume ls -q)
}

purge_all() {
  docker system prune -af
}

if [ -z $1 ]; then
  stop_running_containers
  delete_images
  purge_all
  delete_volumes
elif [ $1 == "c" ] || [ $1 == "containers" ]; then
  stop_running_containers
elif [ $1 == "i" ] || [ $1 == "images" ]; then
  delete_images
elif [ $1 == "v" ] || [ $1 == "volumes" ]; then
  delete_volumes
fi
