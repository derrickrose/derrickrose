provider "aws" {
  profile = "cloud_user"
  region  = "us-east-1"


}

variable "availability_zone" {
  default = ["us-east-1a", "us-east-1c"]
}

resource "aws_instance" "izybe_ec2" {

  count = "${length(var.availability_zone)}"

  ami               = "ami-0b898040803850657"
  availability_zone = "${element(var.availability_zone,count.index )}"
  instance_type     = "t2.micro"
  tags              = {
    "AvailabilityZone" : "${element(var.availability_zone,count.index )}"
    "Name" : "izybe-tf-training-2-ec2-${element(var.availability_zone,count.index )}"
  }


}

output "ec2_output" {
  value = "${aws_instance.izybe_ec2}"
}