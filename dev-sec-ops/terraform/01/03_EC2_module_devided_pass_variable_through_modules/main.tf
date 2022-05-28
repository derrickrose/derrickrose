locals {
  dev_izybe_public_key     = file("id_rsa.pub")
  dev_izybe_ec2_ami_id     = "ami-047bb4163c506cd98"
  dev_izybe_vpc_id         = "vpc-7cbc4e05"
  dev_izybe_key_pair_label = "dev_ec2_key_pair"
  dev_izybe_tag_name       = "dev-izybe-ec2"
  dev_izybe_sg_name        = "dev-izybe-sg"
  dev_izybe_instance_type  = "t2.micro"

}

resource "aws_key_pair" "izybe_key_pair" {
  public_key = local.dev_izybe_public_key
  key_name   = local.dev_izybe_key_pair_label
}

module "dev_izybe_sg" {
  source  = "./izybe_sg"
  vpc_id  = local.dev_izybe_vpc_id
  sg_name = local.dev_izybe_sg_name
}


module "dev_izybe_ec2" {
  source         = "./izybe_ec2"
  ami_id         = local.dev_izybe_ec2_ami_id
  key_pair_label = local.dev_izybe_key_pair_label
  tag_name       = local.dev_izybe_tag_name
  sg_id          = module.dev_izybe_sg.izybe_sg_id
  instance_type  = local.dev_izybe_instance_type
}



