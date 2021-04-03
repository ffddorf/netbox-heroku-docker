terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "4.1.0"
    }
  }
}

variable "app_name" {
  type = string
}

variable "app_region" {
  type    = string
  default = "eu"
}

variable "config_vars" {
  type    = map(string)
  default = {}
}

resource "random_password" "secret_key" {
  length  = 60
  special = true
}

resource "heroku_app" "netbox" {
  name   = var.app_name
  region = var.app_region
  stack  = "container"
  acm    = true

  config_vars = var.config_vars
  sensitive_config_vars = {
    SECRET_KEY = random_password.secret_key.result
  }
}
