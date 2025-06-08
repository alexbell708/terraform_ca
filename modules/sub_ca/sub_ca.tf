locals {
  // 8, 766 hours in a year - multiply by number of years cert is valid
  sub_ca_validity = var.sub_ca_validity_years * 8766
}


resource "tls_locally_signed_cert" "sub_ca" {
  allowed_uses = [
    "cert_signing",
    "crl_signing",
    "key_encipherment",
    "digital_signature"
  ]

  cert_request_pem   = tls_cert_request.sub_ca_csr.cert_request_pem
  ca_private_key_pem = var.root_ca_private_key
  ca_cert_pem        = var.root_ca_cert
  is_ca_certificate  = true

  validity_period_hours = local.sub_ca_validity
}
