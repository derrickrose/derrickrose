locals {
  domain    = "izybe"
  project   = "tf-training-2"
  env       = lookup( {
    default = "dev"
    qa      = "qa"
    prod    = "prod"
  }, terraform.workspace, "dev")
  user_data = file("userdata.sh")

  key = file("id_rsa")
}


provider "aws" {
  profile = "cloud_user"
  region  = "us-east-1"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "${local.env}-${local.domain}-${local.project}-ec2-keypair"
  public_key = file("id_rsa.pub")
}

resource "aws_eip" "ec2_eip" {
  instance = aws_instance.instance_ec2.id
  vpc      = true
}

resource "aws_instance" "instance_ec2" {
  ami           = "ami-0b898040803850657"
  instance_type = "t2.micro"
  tags          = {
    Name = "EC2started_from_console_from_terraform"
  }
  key_name      = aws_key_pair.key_pair.key_name
  user_data     = local.user_data

  provisioner "local-exec" {

    command = "echo ${aws_instance.instance_ec2.public_ip} >> ip_adress.txt"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      password    = ""
      host        = self.public_ip
      private_key = local.key
    }
    source      = "index.html"
    destination = "/tmp/index.html"
  }


}

resource "null_resource" "install_http_server" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      password    = ""
      host        = aws_eip.ec2_eip.public_ip #may be to change with the attached ip_adress ?
      private_key = local.key
    }


    inline = [
      "echo ${aws_eip.ec2_eip.public_ip} >> public_ip.txt",
      "echo toto titi tata >> a.txt",
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd.service",
      "sudo systemctl enable httpd.service",
      "sudo cp /tmp/index.html /var/www/html/index.html"


    ]

  }
}


