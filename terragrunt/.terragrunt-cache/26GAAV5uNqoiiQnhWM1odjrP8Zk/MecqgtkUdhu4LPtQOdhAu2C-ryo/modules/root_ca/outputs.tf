output "root_ca_certificate" {
  description = "Self-signed certificate created as root ca"
  value       = tls_self_signed_cert.root_ca.cert_pem
}

output "root_ca_expiration_date" {
  description = "Expiration date of root ca"
  value       = tls_self_signed_cert.root_ca.validity_end_time
}

output "root_ca_private_key" {
  description = "Private key of root ca used to sign sub ca cert"
  value       = tls_private_key.rsa_private_key.private_key_pem
  sensitive   = true
}
