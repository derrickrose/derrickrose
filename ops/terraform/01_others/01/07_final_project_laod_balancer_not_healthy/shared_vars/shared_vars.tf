data "aws_vpc" "default_vpc" {}
data aws_subnets "default_subnets" {}


locals {

  domain  = "izybe"
  project = "tf-training"

  env = lookup({
    default = "dev",
    qa      = "qa",
    prod    = "prod"
  }, terraform.workspace, "dev")

  vpc_id = lookup({
    dev  = data.aws_vpc.default_vpc.id
    qa   = data.aws_vpc.default_vpc.id
    prod = data.aws_vpc.default_vpc.id
  }, local.env  )

  public_subnet_id_a = lookup({
    dev  = "subnet-00aeb743a22e033ef",
    qa   = "subnet-00aeb743a22e033ef",
    prod = "subnet-00aeb743a22e033ef",
  }, local.env  )

  public_subnet_id_b = lookup({
    dev  = "subnet-0260408a6525f8e58",
    qa   = "subnet-0260408a6525f8e58",
    prod = "subnet-0260408a6525f8e58",
  }, local.env  )

  private_subnet_id = lookup({
    dev  = "subnet-00400929116d25942",
    qa   = "subnet-00400929116d25942",
    prod = "subnet-00400929116d25942",
  }, local.env  )

  instance_type = lookup({
    dev  = "t2.micro",
    qa   = "t2.micro",
    prod = "medium"
  }, local.env)

}

output "vpc_id" {
  value = local.vpc_id
}

output "public_subnet_id_a" {
  value = local.public_subnet_id_a
}

output "public_subnet_id_b" {
  value = local.public_subnet_id_b
}

output "private_subnet_id" {
  value = local.private_subnet_id
}

output "domain" {
  value = local.domain
}

output "project" {
  value = local.project
}
output "env" {
  value = local.env
}


output "instance_type" {
  value = local.instance_type
}