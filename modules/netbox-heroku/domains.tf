variable "custom_domains" {
  type    = list(string)
  default = []
}

resource "heroku_domain" "netbox" {
  for_each = toset(var.custom_domains)

  app      = heroku_app.netbox.id
  hostname = each.value
}
