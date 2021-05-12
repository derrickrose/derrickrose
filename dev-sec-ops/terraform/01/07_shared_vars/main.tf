provider "aws" {
  region = "eu-west-1"
  profile = "review"
}

module "ec2_module_1" {
  #to pass a value of variable to a module
  #to call an output value of a module
  ec2_sg_id = "${module.sg_module.sg_id}"
  #to call and use a module
  source = "./ec2_module"
}

module "sg_module" {
  source = "./sg_module"
}