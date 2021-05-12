locals {
  env = "${terraform.workspace}"
}


provider "aws" {
  region = "eu-west-1"
  profile = "review"
}

module "ec2_module_1" {
  instance_name = "${local.env}-ec2-instance-1"
  ec2_sg_id = "${module.sg_module.sg_id}"
  source = "ec2_module"
}

module "sg_module" {
  source = "sg_module"
}