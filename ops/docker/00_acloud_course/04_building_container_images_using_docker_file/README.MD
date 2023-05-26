## goal : building container images using Dockerfiles :

* to build a Docker file :
  `docker build -t website:1 .`
* to check all images :
  `docker image ls` or `docker images`
* to check the size of the image :
  `docker inspect -f '{{ .Size }}' website:1`
* to check the layers in the image :
  `docker inspect -f '{{ range .RootFS.Layers }}{{ println . }}{{ end }}' website:1`
* to run the container :
  `docker run -d -p 80:80 website:1`
    