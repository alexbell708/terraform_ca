resource "tls_private_key" "rsa_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_cert_request" "csr" {
  private_key_pem = tls_private_key.rsa_private_key.private_key_pem

  subject {
    common_name         = var.subject.common_name
    country             = lookup(var.subject, "country", null)
    email_address       = lookup(var.subject, "email_address", null)
    locality            = lookup(var.subject, "locality", null)
    organization        = lookup(var.subject, "organization", null)
    organizational_unit = lookup(var.subject, "organizational_unit", null)
    postal_code         = lookup(var.subject, "postal_code", null)
    province            = lookup(var.subject, "province", null)
    serial_number       = lookup(var.subject, "serial_number", null)
    street_address      = lookup(var.subject, "street_address", null)
  }

  dns_names    = var.dns_names
  ip_addresses = var.ip_addresses
}
