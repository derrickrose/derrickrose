module "shared_vars" {
  source = "../shared_vars"
}

resource "aws_security_group" "public_sg" {
  name        = "${module.shared_vars.env}-${module.shared_vars.domain}-${module.shared_vars.project}-sg-public"
  description = "terraform course sg for ec2 instance public subnet"
  vpc_id      = module.shared_vars.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "private_sg" {
  depends_on  = [aws_security_group.public_sg]
  name        = "${module.shared_vars.env}-${module.shared_vars.domain}-${module.shared_vars.project}-sg-private"
  description = "terraform course sg for ec2 instance private subnet"
  vpc_id      = module.shared_vars.vpc_id
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
#    security_groups = [aws_security_group.public_sg.id]
     cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_sg_id" {
  value = aws_security_group.public_sg.id
}

output "private_sg_id" {
  value = aws_security_group.private_sg.id
}
