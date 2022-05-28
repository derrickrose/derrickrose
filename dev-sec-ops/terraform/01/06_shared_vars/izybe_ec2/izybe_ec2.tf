locals {
  env = module.shared_vars.env_prefix
}

variable "ami_id" {}


module "shared_vars" {
  source = "../shared_vars"
}

variable "instance_type" {}


variable "sg_id" {}


resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "${local.env}-izybe-ec2-keypair"
  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = "${ local.env }-izybe-ec2"
  }
}