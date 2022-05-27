variable "ami_id" {}

variable "public_key" {}

variable "key_pair_label" {}

variable "instance_type" {}

variable "tag_name" {}

variable "sg_id" {}

resource "aws_key_pair" "izybe_key_pair" {
  public_key = var.public_key
  key_name   = var.key_pair_label
}

resource "aws_instance" "dev_ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_pair_label
  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = var.tag_name
  }
}