variable "amiid" {
  default = "ami-047bb4163c506cd98"
}

variable "ec2_sg_id" {}

module "shared_vars" {
  source = "../shared_vars"
}

resource "aws_instance" "terraform_ec2_instance" {
  ami = var.amiid
  instance_type = "t2.micro"
  key_name = "dev-ec2-keypair"
  vpc_security_group_ids = [
    "${var.ec2_sg_id}"]

  tags = {
    Name = "${module.shared_vars.ec2_instance_name}"
  }
}
