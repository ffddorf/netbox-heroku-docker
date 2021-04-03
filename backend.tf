terraform {
  backend "remote" {
    organization = "ffddorf"

    workspaces {
      name = "netbox"
    }
  }
}
