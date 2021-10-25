# Script create and push image to ECR

## to build image and then push it directly (using a script)

run the command bellow

> /bin/bash create_and_push_image.sh [image_name]

example :

` /bin/bash create_and_push_image.sh hello-flask `

## list images on the registry

` aws ecr list-images --repository-name hello-flask `

