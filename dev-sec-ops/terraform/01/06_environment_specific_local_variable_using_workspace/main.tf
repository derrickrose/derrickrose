locals {
  env = "${terraform.workspace}"

  env_based_ec2_instances = {
    dev:"dev-ec2-instance",
    default:"dev-ec2-instance",
    prod:"prod-ec2-instance",
    qa:"qa-ec2-instance"
  }
  ec2_instance_name = lookup("${local.env_based_ec2_instances}", "${local.env}")
}


provider "aws" {
  region = "eu-west-1"
  profile = "review"
}

module "ec2_module_1" {
  #to pass a value of variable to a module
  instance_name = "${local.ec2_instance_name}"
  #to call an output value of a module
  ec2_sg_id = "${module.sg_module.sg_id}"
  #to call and use a module
  source = "./ec2_module"
}

module "sg_module" {
  source = "./sg_module"
}