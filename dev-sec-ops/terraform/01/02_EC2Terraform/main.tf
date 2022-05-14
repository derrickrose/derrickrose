provider "aws" {
  region  = "eu-west-1"
  profile = "dev-izybe"
}

variable "vpc_id" {
  type    = string
  default = "vpc-7cbc4e05"
}

resource "aws_security_group" "dev_izybe_sg" {
  name        = "dev-izybe-sg"
  description = "terraform course sg for ec2 instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "ami_id" {
  default = "ami-047bb4163c506cd98"
}

resource "aws_instance" "dev_ec2_instance" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  key_name               = "dev-izybe-ec2-keypair"
  vpc_security_group_ids = [aws_security_group.dev_izybe_sg.id]

  tags = {
    Name = "Terraform Ec2 Instance"
  }
}