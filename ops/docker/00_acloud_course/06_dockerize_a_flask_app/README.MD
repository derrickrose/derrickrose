## goal : dockerize a flask app:

The goal right here is to dockerize a flask app fore making notes.

### prerequisites having a running postgres database container on app_network :

* create a docker network with name app_network :
  `docker network create app_network`
* run the postgres container :
  `docker run -d --network app_network postgres:12.1`