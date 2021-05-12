locals {
  env = "${terraform.workspace}"

  env_amiid = {
    dev:"dev-amiid",
    default:"default-amiid",
    prod:"prod-amiid",
    qa:"qa-amiid"
  }
  amiid = lookup("${local.env_amiid}", "${local.env}")
}

output "amiid" {
  value = "${local.amiid}"
}