provider "aws" {
  region = "eu-west-1"
  profile = "review"
}

terraform {
  backend "s3" {
    profile = "review"
    bucket = "dev-terraform-remote-tfstate"
    key = "remotedemo.tfstate"
    region = "eu-west-1"
    dynamodb_table = "dev-dynamodb-terraform-state-lock"

  }
}

output "test" {
  value = "hola mundo remote"
}
