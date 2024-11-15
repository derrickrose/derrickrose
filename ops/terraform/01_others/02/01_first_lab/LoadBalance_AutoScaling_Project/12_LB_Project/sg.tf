
resource "aws_security_group" "ec2_public_security_group" {
    name        = "EC2-public-scg"
    description = "Internet reaching access for public ec2s"
    vpc_id      = aws_vpc.mainvpc.id

    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "ec2_public_security_group"
    }

    depends_on = [aws_vpc.mainvpc]
}

resource "aws_security_group" "ec2_private_security_group" {
    name        = "EC2-private-scg"
    description = "Only allow public SG resources to access private instances"
    vpc_id      = aws_vpc.mainvpc.id

    ingress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      security_groups = [aws_security_group.ec2_public_security_group.id]
    }
    
    egress {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "ec2_private_security_group"
    }

    depends_on = [aws_vpc.mainvpc,aws_security_group.ec2_public_security_group]
}
