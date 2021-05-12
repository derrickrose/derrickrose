provider "aws" {
  region = "eu-west-1"
  profile = "review"
}

#we use alias for example to specify a region when using region-specific resource like elastic ip
provider "aws" {
  alias = "frankfurt"
  region = "eu-central-1"
  profile = "review"
}

resource "aws_eip" "myeip" {
  provider = "aws.frankfurt"
  vpc = true
}

output "myip_address" {
  value = "${aws_eip.myeip.public_ip}"
}