provider "aws" {
  region = "eu-west-1"
  profile = "review"
}

terraform {
  backend "s3" {
    profile = "review"
    bucket = "dev-terraform-remote-tfstate"
    key = "remote-backend/terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "dev-dynamodb-terraform-state-lock"
    #table's partition key should be LockID
  }
}

output "test" {
  value = "hola mundo remote"
}
