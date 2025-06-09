terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "4.1.0"
    }
  }
}

provider "tls" {}

resource "tls_private_key" "rsa_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
