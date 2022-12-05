### Searching for an httpd image on docker hub

* connect to https://hub.docker.com/ with user randofrils :
  `docker login`
* search for http image (on web page)
* pull image http with the command (the latest one):
  `docker pull httpd:2.4`
* list all images on local :
  `docker images`

### Running an image

* run image http with the command (port 8080 of the host -> port 80 of the container) :
  `docker run --name  httpd -d -p 8080:80 httpd:2.4`
* then browse to http://localhost:8080
* list all containers :
  `docker ps`

### other usefully commands :

* stop container with its name :
  `docker stop httpd`
* force stop all containers:
  `docker stop -f $(docker ps -aq)`
* remove all link made from a running container to a given image :
  `docker system prune`
* force remove all images :
  `docker rmi -f $(docker images -aq)`








