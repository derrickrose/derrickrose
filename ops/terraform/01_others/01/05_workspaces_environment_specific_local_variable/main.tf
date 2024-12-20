locals {

  env = lookup({
    "dev" : "dev",
    "qa" : "qa",
    "prod" : "prod"
  }, terraform.workspace, "dev" )

  izybe_public_key     = file("id_rsa.pub")
  izybe_ec2_ami_id     = "ami-047bb4163c506cd98"
  izybe_vpc_id         = "vpc-7cbc4e05"
  izybe_key_pair_label = "${local.env}-ec2-key-pair"
  izybe_tag_name       = "${local.env}-izybe-ec2"
  izybe_sg_name        = "${local.env}-izybe-sg"
  izybe_instance_type  = "t2.micro"

}

resource "aws_key_pair" "izybe_key_pair" {
  public_key = local.izybe_public_key
  key_name   = local.izybe_key_pair_label
}

module "izybe_sg" {
  source  = "izybe_sg"
  vpc_id  = local.izybe_vpc_id
  sg_name = local.izybe_sg_name
}


module "izybe_ec2" {
  source         = "izybe_ec2"
  ami_id         = local.izybe_ec2_ami_id
  key_pair_label = local.izybe_key_pair_label
  tag_name       = local.izybe_tag_name
  sg_id          = module.izybe_sg.izybe_sg_id
  instance_type  = local.izybe_instance_type
}

output "workspace_environment" {
  #juste pour voir le selected workspace
  value = "${terraform.workspace}_${local.env}"
}