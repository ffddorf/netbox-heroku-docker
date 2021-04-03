module "netbox" {
  source = "./modules/netbox-heroku"

  app_name = "ffddorf-netbox-test"
  config_vars = {
    LOGIN_REQUIRED = "true"
  }
  custom_domains = [
    "netbox.freifunk-duesseldorf.de",
    "netbox-test.freifunk-duesseldorf.de",
  ]
}

output "dns_name" {
  value = module.netbox.dns_name
}
