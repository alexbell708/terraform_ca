locals {
  sub_ca_allowed_uses = [
    "cert_signing",
    "crl_signing",
    "key_encipherment",
    "digital_signature"
  ]

  server_cert_allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth"
  ]
}

resource "tls_locally_signed_cert" "cert" {
  allowed_uses       = var.is_ca_certificate == true ? local.sub_ca_allowed_uses : local.server_cert_allowed_uses
  cert_request_pem   = tls_cert_request.csr.cert_request_pem
  ca_private_key_pem = var.ca_private_key_pem
  ca_cert_pem        = var.ca_cert_pem
  is_ca_certificate  = var.is_ca_certificate

  validity_period_hours = var.validity_period
}
