output "root_ca_certificate" {
  description = "Self-signed certificate created as root ca"
  value       = tls_self_signed_cert.root_ca.cert_pem
}

output "root_ca_expiration_date" {
  description = "Expiration date of root ca"
  value       = tls_self_signed_cert.root_ca.validity_end_time
}
