# Dockerfile

https://docs.docker.com/engine/reference/builder/#entrypoint

## hello-flask

is a Flask app in order to deep dev with docker containerization

## build with

` docker build -t hello-flask:latest . `

## run with

` docker run -d --name hello-flask -p 5000:5000 hello-flask `

## deploy to aws ECR

### create a repository in aws ECR and note the given FMI (on the URI)

` aws ecr create-repository --repository-name hello-flask `

### tag image with

docker tag hello-flask:latest FMI.dkr.ecr.us-west-2.amazonaws.com/hello-flask:latest

example :

` docker tag hello-flask:latest 893739846413.dkr.ecr.eu-west-3.amazonaws.com/hello-flask:latest `

### first login

` aws ecr get-login-password --region eu-west-3 `
` docker login -u AWS -p [given secret key here] https://893739846413.dkr.ecr.eu-west-3.amazonaws.com ` 

### push image with

docker push FMI.dkr.ecr.us-west-2.amazonaws.com/hello-flask:latest

example :

` docker push 893739846413.dkr.ecr.eu-west-3.amazonaws.com/hello-flask:latest `


