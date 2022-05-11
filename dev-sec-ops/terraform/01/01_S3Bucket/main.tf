provider "aws" {
  region  = "eu-west-1"
  profile = "review"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "dev-terraform-test"
  acl    = "private"
  tags   = {
    Environment = "dev"
  }
}

resource "aws_s3_bucket_object" "my_first_object" {
  bucket     = aws_s3_bucket.my_bucket.id
  depends_on = [aws_s3_bucket.my_bucket]
  key        = "testfile.txt"
  source     = "test_files/sample_texte.txt"
  etag       = "${md5(file("test_files/sample_texte.txt"))}"
}