locals {
  dev_izybe_public_key = file("id_rsa.pub")

}


output "izybe_ec2_key_pair" {
  value = local.dev_izybe_public_key
}



module "dev_izybe_ec2" {
  source = "./ec2_module"
  izybe_ec2_key_pair = local.dev_izybe_public_key
}