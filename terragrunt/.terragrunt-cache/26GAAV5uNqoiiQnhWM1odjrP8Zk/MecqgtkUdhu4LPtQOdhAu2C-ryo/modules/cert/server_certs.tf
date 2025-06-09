resource "tls_locally_signed_cert" "example" {
  cert_request_pem   = tls_cert_request.csr.cert_request_pem
  ca_private_key_pem = var.ca_private_key_pem
  ca_cert_pem        = var.ca_cert_pem

  // 7 days
  validity_period_hours = 168

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}
