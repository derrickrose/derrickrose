provider "aws" {
  region  = "us-east-1"
  profile = "cloud_user"
}


module "bucket" {
  source = "../bucket"
  env = "prod"
}