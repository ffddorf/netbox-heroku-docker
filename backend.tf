terraform {
  backend "remote" {
    organization = "ffddorf"

    workspaces {
      name = "netbox"
    }
  }
}

provider "google" {
  project = "netbox-323812"
  region  = "europe-west3"
}
