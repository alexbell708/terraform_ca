// Create self signed certificate to use as root ca
resource "tls_self_signed_cert" "root_ca" {
  private_key_pem       = tls_private_key.rsa_private_key.private_key_pem
  validity_period_hours = var.validity_period

  // root ca requires keyCertSign and cRLSign uses
  allowed_uses = [
    "cert_signing",
    "crl_signing"
  ]

  is_ca_certificate = true

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
}
