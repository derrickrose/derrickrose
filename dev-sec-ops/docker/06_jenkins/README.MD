# Custom Jenkins project with blue ocean plugin pre-installed

## build with:

` docker build -t jenkins-blueocean:latest . `

## create network with:

` docker network create jenkins `

## run with:

> ./run.sh

## accessing:

` docker exec -it jenkins-blueocean bash `

## accessing the log

` docker logs jenkins-blueocean `

## initializionPass under

> /var/jenkins_home/secret/

## for details:

https://www.jenkins.io/doc/book/installing/docker/

## on browser

http://localhost:8081/

## user creates