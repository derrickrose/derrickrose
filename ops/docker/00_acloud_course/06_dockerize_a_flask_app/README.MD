## goal : dockerize a flask app:

The goal right here is to dockerize a flask app fore making notes.

### prerequisites having a running postgres database container on app_network :

* create a docker network with name app_network :
  `docker network create note_app_network`
* run the postgres container :
  `docker run --network note_app_network --name postgres_db -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres:12.1`
* connect to the postgres container :
  `docker exec -it postgres_db bash`
* create the database notes :
  `createdb -U postgres notes` #here notes is the database's name
* to connect to the new created database :
  `psql -U postgres notes` #here notes is the db name
* to list all existing tables :
  `\ŀ`
* to quit the postgres command prompt just :
  `\q`

### building the image and running the container:

First should have the Dockerfile inside the current prompt command then run the command :
`docker build -t noteapp:0.1 .`

* list all images :
  `docker image ls`
* run the container :
  `docker run --rm -it --network note_app_network -v /home/frils/notes/migrations:/app/notes/migrations noteapp:0.1 bash`

### configuring the connection to the database

On the running terminal of the container, pointed to the app directory type the command :
`flask db init`
==> see migrations generated files

* list migration generated files :
  `ls migrations`
* migrate the db:
  `flask db migrate`
* upgrade the db:
  `flask db upgrade`

### running the app

* run with the command :
  `docker run --rm -it --network note_app_network -p 80:80 noteapp:0.1`

### take off debug mode of the flask app :

In order to do that, we should just take off the line FLASK_ENV=development on the .env file
Build another image tagged noteapp:0.2
Then run a container with it
`docker run --rm -it --network note_app_network -p 80:80 notapp:0.2`

### running in production environment using gunicorn (production ready wsgi web server gateway interface)

* step 1 run a container which mount the pip file
  `docker run -it --name noteappprod --rm -v /home/frils/Documents/reviews/derrickrose/ops/docker/00_acloud_course/06_dockerize_a_flask_app/notes_0_2/Pipfile:/tmp/Pipfile --network note_app_network -p 80:80 noteapp:0.2 bash`
* install gunicorn on the terminal of the container :
  `pipenv install gunicorn`
  ==> must see that gunicorn package is added on bottom of packages list of our Pipfile

Note that flask automatically read .env file, but gunicorn needs to be explicitly told to do that
==> changes made on __init__.py file

* build the new image for production use :
  `docker build -t noteapp:0.3 .`
* to run the container :
  `docker run -d --rm -p 80:80 --network note_app_network --name noteappprod noteapp:0.3`
  ==> note that even we upgrade our webserver, we still have our notes 