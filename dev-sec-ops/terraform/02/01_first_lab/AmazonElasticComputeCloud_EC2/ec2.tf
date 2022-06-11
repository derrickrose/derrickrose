locals {
  domain  = "izybe"
  project = "tf-training-2"
  env     = lookup( {
    default = "dev"
    qa      = "qa"
    prod    = "prod"
  }, terraform.workspace, "dev")
}


resource "aws_key_pair" "key_pair" {
  key_name   = "${local.env}-${local.domain}-${local.project}-ec2-keypair"
  public_key = file("id_rsa.pub")
}

resource "aws_instance" "MyFirstEc2instance_from_terraform" {
  ami           = "ami-0b898040803850657"
  instance_type = "t2.micro"
  tags          = {
    Name = "EC2started_from_console_from_terraform"
  }
  key_name      = aws_key_pair.key_pair.key_name
  user_data     = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend , I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
                EOF
}


