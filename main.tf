locals {
  domains = [
    "netbox-test.freifunk-duesseldorf.de",
    "netbox-next.freifunk-duesseldorf.de",
  ]
}

module "origin_cert" {
  source = "./modules/cf-origin-ca"

  common_names = local.domains
}

module "netbox" {
  source = "./modules/netbox-heroku"

  app_name = "ffddorf-netbox-next"
  config_vars = {
    LOGIN_REQUIRED = "true"
  }
  custom_domains = local.domains

  ssl_certificate_enabled = true
  ssl_certificate_pem     = module.origin_cert.origin_certificate
  ssl_private_key_pem     = module.origin_cert.origin_private_key
}

output "dns_names" {
  value = module.netbox.dns_names
}
