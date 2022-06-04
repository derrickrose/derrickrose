data aws_ami "ubuntu_ami" {

  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["aws-marketplace"]
}

locals {
  ami_id   = data.aws_ami.ubuntu_ami.id
  max_size = 10
  min_size = 3
}

module "shared_vars" {
  source = "../shared_vars"
}

resource "aws_key_pair" "key_pair" {
  public_key = file("id_rsa.pub")
  key_name   = "${module.shared_vars.env}-${module.shared_vars.domain}-${module.shared_vars.project}-ec2-keypair"
}

variable private_sg_id {}

resource "aws_launch_configuration" "launch_conf" {
  name            = "${module.shared_vars.env}-${module.shared_vars.domain}-${module.shared_vars.project}-lc"
  image_id        = local.ami_id
  instance_type   = module.shared_vars.instance_type
  key_name        = aws_key_pair.key_pair.key_name
  user_data       = file("assets/user_data.txt") #note that it is considered as on the same directory as the main
  security_groups = [var.private_sg_id]
}

variable "target_group_arn" {}

resource "aws_autoscaling_group" "autoscaling_group" {
  name                 = "${module.shared_vars.env}-${module.shared_vars.domain}-${module.shared_vars.project}-asg"
  max_size             = local.max_size
  min_size             = local.min_size
  launch_configuration = aws_launch_configuration.launch_conf.name
  vpc_zone_identifier  = [module.shared_vars.public_subnet_id_a]
  target_group_arns    = [var.target_group_arn]
  tag {
    key                 = "name"
    value               = "${module.shared_vars.env}-${module.shared_vars.domain}-${module.shared_vars.project}-asg"
    propagate_at_launch = true
  }

  tag {
    key                 = "env"
    value               = module.shared_vars.env
    propagate_at_launch = true
  }

}
