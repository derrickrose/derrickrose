provider "aws" {
  region  = "us-east-1"
  profile = "cloud_user"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "dev-izybe-tf-training-2"
  #  acl    = "private"
  tags   = {
    Environment = "dev"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket     = aws_s3_bucket.s3_bucket.id
  depends_on = [aws_s3_bucket.s3_bucket]
  acl = "private" #public-read
}
