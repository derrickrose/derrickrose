repository_name=$1

create_repository() {
  aws ecr create-repository --repository-name $repository_name > $repository_name.json
}

get_repository_uri() {
  py -m repository_response $repository_name.json
}

read_repository_uri() {
  cat $repository_name.txt
}

# build image
docker build -t $repository_name:latest .

# create repository on ECR and get URI
create_repository
get_repository_uri
repository_uri=$(read_repository_uri)

# tag image
docker tag $repository_name:latest $repository_uri:latest

secret=$(aws ecr get-login-password --region eu-west-3)
docker login -u AWS -p $secret https://$repository_uri
docker push $repository_uri:latest
rm *.txt *.json
