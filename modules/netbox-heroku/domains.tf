variable "custom_domains" {
  type    = list(string)
  default = []
}

resource "heroku_domain" "netbox" {
  for_each = toset(var.custom_domains)

  app      = heroku_app.netbox.id
  hostname = each.value
}

output "dns_names" {
  value = [for d in heroku_domain.netbox : {
    record_name = d.hostname
    target      = var.ssl_certificate_enabled ? heroku_cert.custom_cert.cname : d.cname
  }]
}
