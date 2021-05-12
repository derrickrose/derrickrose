variable "vpcid" {
  type = string
  default = "vpc-8ffb5bf6"
}

resource "aws_security_group" "terraform_ec2_sg" {
  name = "terraform_ec2_sg"
  description = "terraform course sg for ec2 instance"
  vpc_id = "${var.vpcid}"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}

output "sg_id" {
  value = "${aws_security_group.terraform_ec2_sg.id}"
}