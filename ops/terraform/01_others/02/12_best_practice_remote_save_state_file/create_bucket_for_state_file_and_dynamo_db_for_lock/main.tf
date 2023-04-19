provider "aws" {
  profile = "cloud_user"
  region  = "us-east-1"
}


resource "aws_s3_bucket" "bucket" {
  bucket = "dev-izybe-tf-training-2-bucket-tfstate"
}

resource "aws_dynamodb_table" "dynamo_table" {
  name           = "dev-izybe-tf-training-2-dynamo-table-tflock"
  write_capacity = 5
  read_capacity  = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

}