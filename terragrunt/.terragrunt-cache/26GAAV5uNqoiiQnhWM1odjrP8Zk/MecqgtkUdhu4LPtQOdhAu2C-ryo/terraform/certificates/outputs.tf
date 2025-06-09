output "certificate" {
  description = "Certificate signed by CA"
  value       = tls_locally_signed_cert.cert.cert_pem
}

output "certificate_expiration_date" {
  description = "Expiration date of certificate"
  value       = tls_locally_signed_cert.cert.validity_end_time
}

output "certificate_private_key" {
  description = "Private key of certificate"
  value       = var.is_ca_certificate == true ? tls_private_key.rsa_private_key.private_key_pem : null
  sensitive   = true
}
