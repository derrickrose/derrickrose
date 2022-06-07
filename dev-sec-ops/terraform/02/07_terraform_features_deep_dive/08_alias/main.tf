provider "aws" {
  region = "us-east-1"
  profile = "cloud_user"
}

#we use alias for example to specify a region when using region-specific resource like elastic ip
provider "aws" {
  alias = "frankfurt"
  region = "eu-central-1"
  profile = "cloud_user"
}

resource "aws_eip" "myeip" {
  provider = "aws.frankfurt"
  vpc = true
}

output "myip_address" {
  value = "${aws_eip.myeip.public_ip}"
}