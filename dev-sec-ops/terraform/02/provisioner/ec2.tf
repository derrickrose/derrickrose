locals {
  domain    = "izybe"
  project   = "tf-training-2"
  env       = lookup( {
    default = "dev"
    qa      = "qa"
    prod    = "prod"
  }, terraform.workspace, "dev")
  user_data = file("userdata.sh")
}


provider "aws" {
  profile = "cloud_user"
  region  = "us-east-1"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "${local.env}-${local.domain}-${local.project}-ec2-keypair"
  public_key = file("id_rsa.pub")
}

resource "aws_instance" "ec2" {
  ami           = "ami-0b898040803850657"
  instance_type = "t2.micro"
  tags          = {
    Name = "EC2started_from_console_from_terraform"
  }
  key_name      = aws_key_pair.key_pair.key_name
  user_data     = local.user_data


  provisioner "local-exec" {
    command = "echo ${aws_instance.ec2.public_ip} >> ip_adress.txt"
  }
}


