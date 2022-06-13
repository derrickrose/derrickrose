
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.env}-izybe-tf-training-2"
  #  acl    = "private"
  tags   = {
    Environment = var.env
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket     = aws_s3_bucket.s3_bucket.id
  depends_on = [aws_s3_bucket.s3_bucket]
  acl        = "private" #public-read
}
