provider "aws" {
  region  = "us-east-1"
  profile = "cloud_user"
}


resource "aws_s3_bucket" "s3_bucket_importing" {

}

