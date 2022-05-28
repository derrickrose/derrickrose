locals {
  env = module.shared_vars.env_prefix
}

variable "vpc_id" {}

module "shared_vars" {
  source = "../shared_vars"
}


resource "aws_security_group" "izybe_sg" {
  name        = "${local.env}-izybe-sg"
  description = "terraform course sg for ec2 instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "izybe_sg_id" {
  value = aws_security_group.izybe_sg.id
}