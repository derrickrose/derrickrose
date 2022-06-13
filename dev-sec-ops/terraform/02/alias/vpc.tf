locals {


}

provider "aws" {
  alias   = "Virginia"
  region  = "us-east-1"
  profile = "cloud_user"
}

provider "aws" {
  alias   = "Osaka"
  region  = "ap-northeast-3"
  profile = "cloud_user"
}

resource "aws_s3_bucket" "bucket" {
  provider = aws.Osaka



  bucket = "dev-izybe-tf-training-2-"
}