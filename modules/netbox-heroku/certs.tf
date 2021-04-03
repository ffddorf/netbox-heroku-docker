variable "ssl_certificate_enabled" {
  type    = bool
  default = false
}

variable "ssl_certificate_pem" {
  type    = string
  default = ""
}

variable "ssl_private_key_pem" {
  type      = string
  sensitive = true
  default   = ""
}

resource "heroku_addon" "ssl" {
  count = var.ssl_certificate_enabled ? 1 : 0

  app  = heroku_app.netbox.uuid
  plan = "ssl"
}

# Establish certificate for a given application
resource "heroku_cert" "custom_cert" {
  count = var.ssl_certificate_enabled ? 1 : 0

  app               = heroku_app.netbox.uuid
  certificate_chain = var.ssl_certificate_pem
  private_key       = var.ssl_private_key_pem
  depends_on        = [heroku_addon.ssl]
}
