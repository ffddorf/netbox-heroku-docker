module "netbox" {
  source = "./modules/netbox-heroku"

  app_name = "ffddorf-netbox-test"
  config_vars = {
    LOGIN_REQUIRED = "true"
  }
}

output "dns_name" {
  value = module.netbox.dns_name
}
