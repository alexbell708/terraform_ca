terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

// create a random string to use as subject common name for ca cert
resource "random_string" "common_name" {
  length  = 8
  special = false
  upper   = false
}

output "common_name" {
  value = random_string.common_name.id
}

// create random number for hours cert is valid
resource "random_integer" "validity_period" {
  min = 1
  max = 100
}

output "validity_period" {
  value = random_integer.validity_period.id
}
