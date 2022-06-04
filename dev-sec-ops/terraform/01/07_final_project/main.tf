terraform {
  required_providers {
    aws = "4.17.1"
  }
  required_version = "1.1.9"
}


locals {
  domain  = "izybe"
  project = "study-tf"
}

provider "aws" {
  profile = "cloud_user"
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


