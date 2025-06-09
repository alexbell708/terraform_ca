output "csr" {
  value = tls_cert_request.csr.cert_request_pem
}

output "private_key" {
  value     = tls_private_key.rsa_private_key.private_key_pem
  sensitive = true
}
