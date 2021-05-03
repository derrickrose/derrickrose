provider "aws" {
	region = "eu-west-1"
	profile = "review"
}

variable "vpcid" {
	type = "string"
	default = "vpc-8ffb5bf6"
}

resource "aws_security_group" "terraform_ec2_sg" {
  name        = "terraform_ec2_sg"
  description = "terraform course sg for ec2 instance"
  vpc_id      = "${var.vpcid}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

variable "amiid" {
	default = "ami-047bb4163c506cd98"
}

resource "aws_instance" "terraform_ec2_instance" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  key_name = "dev-ec2-keypair"
  vpc_security_group_ids = ["${aws_security_group.terraform_ec2_sg.id}"]
 
  tags = {
    Name = "Terraform Ec2 Instance"
  }
}