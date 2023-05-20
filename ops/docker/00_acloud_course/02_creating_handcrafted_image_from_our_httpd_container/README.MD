## goal : connection to a running container :

On a running container we copy our web pages inside

* github link : https://github.com/linuxacademy/content-widget-factory-inc
* directory in which the web pages should be paste : /usr/local/apache2/htdocs/
* check the size of the image and reduce if possible

### lab

* pull the httpd image :
  `docker pull httpd:2.4`
* run httpd container
  `docker run --name httpd -d httpd:2.4`
* connect to the container's terminal
  `docker exec -ti httpd bash`
* update software dependencies list of the container
  `apt update`
* install git
  `apt install git`
* clone project
  `git clone https://github.com/linuxacademy/content-widget-factory-inc /temp/web-static`
* copy project files to the htdocs directory
  `cp -r /temp/web-static/web/* /usr/local/apache2/htdocs/`
* preparing to send the new created image
  Notice that the option -f on docker ps is to filter the containers with any param (here we do filter by its name)
  `docker commit $(docker ps -f name=httpd -aq) randofrils/web-factory:v1`
  `docker commit CONTAINER_ID randofrils/web-factory:v1`
* send the new images :
  `docker push randofrils/web-factory:v1`

### image optimization

Having a look at the size of our new image, we notice that it is way too enormous, we have to optimize it by deleting
the temp files
then removing installed git

* removing installed git, all needed dependencies and clean cache (should be connected to container's terminal first,
  see previous commands) :
  `apt remove git -y && apt autoremove -y && apt clean`
* deleting all files inside /temp/web-static :
  `rm -rf /temp/web-static`
* commit the new image with a different version (v2):
  `docker commit $(docker ps -f name=httpd -aq) randofrils/web-factory:v2`
* list all available images :
  `docker images`
  We have now a more light image
* to push :
  `docker push randofrils/web-factory:v2`