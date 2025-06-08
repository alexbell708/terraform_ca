locals {
  // 8, 766 hours in a year - multiply by number of years cert is valid
  root_ca_validity = var.root_ca_validity_years * 8766
}

// Create self signed certificate as a root ca
resource "tls_self_signed_cert" "root_ca" {
  private_key_pem = tls_private_key.rsa-private-key.private_key_pem

  //10 years
  validity_period_hours = local.root_ca_validity

  // root ca requires keyCertSign and cRLSign uses
  allowed_uses = [
    "cert_signing",
    "crl_signing"
  ]

  is_ca_certificate = true

  subject {
    common_name         = var.root_ca_subject.common_name
    country             = lookup(var.root_ca_subject, "country", null)
    email_address       = lookup(var.root_ca_subject, "email_address", null)
    locality            = lookup(var.root_ca_subject, "locality", null)
    organization        = lookup(var.root_ca_subject, "organization", null)
    organizational_unit = lookup(var.root_ca_subject, "organizational_unit", null)
    postal_code         = lookup(var.root_ca_subject, "postal_code", null)
    province            = lookup(var.root_ca_subject, "province", null)
    serial_number       = lookup(var.root_ca_subject, "serial_number", null)
    street_address      = lookup(var.root_ca_subject, "street_address", null)
  }
}
