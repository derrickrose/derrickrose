locals {

  profile = "dev-izybe"
  region  = "eu-west-3"

  default_vpc_id = lookup({
    "eu-west-3" : "vpc-9c82b8f5"
    "eu-west-1" : "vpc-7cbc4e05"
  }, local.region)

  default_ami_id = lookup({
    "eu-west-3" : "ami-0a21d1c76ac56fee7",
    "eu-west-1" : "ami-047bb4163c506cd98"
  }, local.region)

  izybe_public_key    = file("id_rsa.pub")
  izybe_instance_type = "t2.micro"
  env                 = module.shared_vars.env_prefix

}

provider "aws" {
  region  = local.region
  profile = local.profile
}

module "shared_vars" {
  source = "./shared_vars"
}

resource "aws_key_pair" "izybe_key_pair" {
  key_name   = "${local.env}-izybe-ec2-keypair"
  public_key = local.izybe_public_key
}

module "izybe_sg" {
  source = "./izybe_sg"
  vpc_id = local.default_vpc_id
}


module "izybe_ec2" {
  source        = "./izybe_ec2"
  ami_id        = local.default_ami_id
  sg_id         = module.izybe_sg.izybe_sg_id
  instance_type = local.izybe_instance_type
}

