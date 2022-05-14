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
  default = "ami-047bb4163c506cd98" //ubuntu ami
}

variable "izybe_ec2_key_pair" {
  default = "dev-izybe-ec2-key-pair"

}

resource "aws_key_pair" "izybe_key_pair" {
  public_key = file("id_rsa.pub")
  key_name   = var.izybe_ec2_key_pair
}

resource "aws_instance" "dev_ec2_instance" {
  ami                    = var.ami_id
  depends_on             = [aws_key_pair.izybe_key_pair]
  instance_type          = "t2.micro"
  key_name               = var.izybe_ec2_key_pair
  vpc_security_group_ids = [aws_security_group.dev_izybe_sg.id]

  tags = {
    Name = "dev-izybe-ec2"
  }
}