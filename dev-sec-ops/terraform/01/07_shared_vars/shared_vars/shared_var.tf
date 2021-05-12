locals {
  env = "${terraform.workspace}"

  env_based_ec2_instances = {
    dev:"dev-ec2-instance",
    default:"dev-ec2-instance",
    prod:"prod-ec2-instance",
    qa:"qa-ec2-instance"
  }
  ec2_instance_name = lookup("${local.env_based_ec2_instances}", "${local.env}")
}

output "ec2_instance_name" {
  value = "${local.ec2_instance_name}"
}