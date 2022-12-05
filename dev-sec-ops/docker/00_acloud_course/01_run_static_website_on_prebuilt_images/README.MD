## Searching for an httpd image on docker hub

* connect to https://hub.docker.com/ with user randofrils :
  `docker login`
* search for http image (on web page)
* pull image http with the command (the latest one):
  `docker pull httpd:2.4`
* list all images on local :
  `docker images`

## Running an image

* run image http with the command (port 8080 of the host -> port 80 of the container) :
  `docker run --name  httpd -d -p 8080:80 httpd:2.4`
* then browse to http://localhost:8080
* list all containers :
  `docker ps`

## other usefully commands :

#### connect to terminal of running container :

`docker exec -ti httpd bash`

#### stop container with its name and remove container :

`docker stop httpd && docker rm -f httpd`

#### another way to do so :

* stop container with its name :
  `docker stop httpd`
* force stop all containers:
  `docker stop -f $(docker ps -aq)`
* remove all link made from a running container to a given image :
  `docker system prune`

#### force remove all images :

`docker rmi -f $(docker images -aq)`

## cloning the static website :

* clone the static website :
  `git clone https://github.com/linuxacademy/content-widget-factory-inc`

## running the website into our container httpd :

* run :
  `docker run --name httpd -p 8080:80 -v /home/frils/Documents/others/content-widget-factory-inc/web/:/usr/local/apache2/htdocs:ro -d httpd:2.4`

## running our website into our container ngnix :

* run : 
`docker run --name nginx -p 8081:80 -v /home/frils/Documents/others/content-widget-factory-inc/web/:/usr/share/nginx/html:ro -d nginx:1.23.2`



