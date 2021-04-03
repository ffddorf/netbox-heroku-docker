locals {
  domains = [
    "netbox-next.freifunk-duesseldorf.de",
    "netbox.freifunk-duesseldorf.de",
  ]
}

module "netbox" {
  source = "./modules/netbox-heroku"

  # warning: Changing this may recreate the DB, deleting data
  app_name = "ffddorf-netbox-next"
  config_vars = {
    LOGIN_REQUIRED = "true"
  }
  custom_domains = local.domains
}

output "dns_names" {
  value = module.netbox.dns_names
}
