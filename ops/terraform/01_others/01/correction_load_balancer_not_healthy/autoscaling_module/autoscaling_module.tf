module "shared_vars" {
  source = "../shared_vars"
}

variable privatesg_id {}
variable tg_arn {}


data aws_ami "ubuntu_ami" {

  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["aws-marketplace"]
}

locals {
  ami_id   = "ami-0c4f7023847b90238"
  max_size = 10
  min_size = 1
}


locals {
  env = "${terraform.workspace}"


  amiid     = "ami-0c4f7023847b90238"

  instancetype_env = {
    default    = "t2.micro"
    staging    = "t2.micro"
    production = "t2.medium"
  }
  instancetype     = "${lookup(local.instancetype_env, local.env)}"

  keypairname_env = {
    default    = "aws_project_tf_kp_staging"
    staging    = "aws_project_tf_kp_staging"
    production = "aws_project_tf_kp_production"
  }
  keypairname     = "${lookup(local.keypairname_env, local.env)}"

  asgdesired_env = {
    default    = "1"
    staging    = "1"
    production = "2"
  }
  asgdesired     = "${lookup(local.asgdesired_env, local.env)}"

  asgmin_env = {
    default    = "1"
    staging    = "1"
    production = "2"
  }
  asgmin     = "${lookup(local.asgmin_env, local.env)}"

  asgmax_env = {
    default    = "2"
    staging    = "2"
    production = "4"
  }
  asgmax     = "${lookup(local.asgmax_env, local.env)}"

}

resource "aws_key_pair" "key_pair" {
  public_key = file("id_rsa.pub")
  key_name   = "${module.shared_vars.env_suffix}-izybe-tf-training-ec2-keypair"
}

resource "aws_launch_configuration" "sampleapp_lc" {
  name            = "sampleapp_lc_${local.env}"
  image_id        = "${local.amiid}"
  instance_type   = "${local.instancetype}"
  key_name        = aws_key_pair.key_pair.key_name
  user_data       = "${file("assets/userdata.txt")}"
  security_groups = ["${var.privatesg_id}"]
}

resource "aws_autoscaling_group" "sampleapp_asg" {
  name                 = "sampleapp_asg_${module.shared_vars.env_suffix}"
  max_size             = "${local.asgmax}"
  min_size             = "${local.asgmin}"
  desired_capacity     = "${local.asgdesired}"
  launch_configuration = "${aws_launch_configuration.sampleapp_lc.name}"
  vpc_zone_identifier  = ["${module.shared_vars.publicsubnetid1}"]
  target_group_arns    = ["${var.tg_arn}"]

  tag {
    key                 = "Name"
    value               = "SampleApp_${module.shared_vars.env_suffix}"
    propagate_at_launch = true
  }
  tag {
    key                 = "Environment"
    value               = "${module.shared_vars.env_suffix}"
    propagate_at_launch = true
  }
}