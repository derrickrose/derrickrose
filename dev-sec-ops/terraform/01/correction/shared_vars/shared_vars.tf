data "aws_vpc" "default_vpc" {}
data aws_subnets "default_subnets" {}


output "vpcid" {
  value = "${local.vpcid}"
}

output "publicsubnetid1" {
  value = "${local.publicsubnetid1}"
}

output "publicsubnetid2" {
  value = "${local.publicsubnetid2}"
}

output "privatesubnetid" {
  value = "${local.privatesubnetid}"
}

output "env_suffix" {
  value = "${local.env}"
}

locals {
  env = "${terraform.workspace}"

  env_suffix = lookup({
    default = "dev"
    qa      = "qa"
    prod    = "prod"
  }, terraform.workspace)


  vpcid = lookup({
    dev  = data.aws_vpc.default_vpc.id
    qa   = data.aws_vpc.default_vpc.id
    prod = data.aws_vpc.default_vpc.id
  }, local.env_suffix  )


  publicsubnetid1 = lookup({
    dev  = data.aws_subnets.default_subnets.ids[0],
    qa   = data.aws_subnets.default_subnets.ids[0],
    prod = data.aws_subnets.default_subnets.ids[0],
  }, local.env_suffix  )


  publicsubnetid2 = lookup({
    dev  = data.aws_subnets.default_subnets.ids[1],
    qa   = data.aws_subnets.default_subnets.ids[1],
    prod = data.aws_subnets.default_subnets.ids[1],
  }, local.env_suffix  )


  privatesubnetid = lookup({
    dev  = data.aws_subnets.default_subnets.ids[2],
    qa   = data.aws_subnets.default_subnets.ids[2],
    prod = data.aws_subnets.default_subnets.ids[2],
  }, local.env_suffix  )

}

