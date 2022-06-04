locals {
  domain  = "izybe"
  project = "study-tf"
}

provider "aws" {
  profile = "dev-acloud"
  region  = "us-east-1"
}

module "load_balancer" {
  source = "./load_balancer"
}

module "auto_scaling" {
  source           = "./auto_scaling"
  private_sg_id    = module.load_balancer.private_sg_id
  target_group_arn = module.load_balancer.target_group_arn
}

module "shared_vars" {
  source = "./shared_vars"
}

