provider "aws" {
  region  = "us-east-1"
  profile = "cloud_user"
}


terraform {
  backend "s3" {
    key            = "dev/izybe/tf-training-2/02-12-terraform.tfstate"
    bucket         = "dev-izybe-tf-training-2-bucket-tfstate"
    profile        = "cloud_user"
    region         = "us-east-1"
    dynamodb_table = "dev-izybe-tf-training-2-dynamo-table-tflock"

  }
}


resource "aws_s3_bucket" "bucket" {
  bucket = "dev-izybe-tf-training-2-bucket-test"
}