locals {

  env = lookup({
    "default" : "dev",
    "prod" : "prod",
    "qa" : "qa"
  }, terraform.workspace, "dev")

}

output "env_prefix" {
  value = local.env
}