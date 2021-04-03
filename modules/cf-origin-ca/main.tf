terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.19.2"
    }
  }
}

variable "common_names" {
  type = list(string)
}

# Create a CSR and generate a CA certificate
resource "tls_private_key" "origin_cert" {
  algorithm = "RSA"
}

resource "tls_cert_request" "origin_cert" {
  key_algorithm   = tls_private_key.origin_cert.algorithm
  private_key_pem = tls_private_key.origin_cert.private_key_pem

  subject {
    common_name  = var.common_names[0]
    organization = "Freifunk Düsseldorf e.V."
  }
}

resource "cloudflare_origin_ca_certificate" "origin_cert" {
  csr          = tls_cert_request.origin_cert.cert_request_pem
  hostnames    = var.common_names
  request_type = "origin-rsa"
}

output "origin_certificate" {
  value = cloudflare_origin_ca_certificate.origin_cert.certificate
}

output "origin_private_key" {
  value     = tls_private_key.origin_cert.private_key_pem
  sensitive = true
}