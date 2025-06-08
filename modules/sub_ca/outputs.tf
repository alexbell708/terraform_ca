output "sub_ca_certificate" {
  description = "Sub CA signed by local root CA"
  value       = tls_locally_signed_cert.sub_ca.cert_pem
}

output "sub_ca_expiration_date" {
  description = "Expiration date of sub ca"
  value       = tls_locally_signed_cert.sub_ca.validity_end_time
}

output "sub_ca_private_key" {
  description = "Private key of sub ca used to sign sub ca cert"
  value       = tls_private_key.rsa_private_key.private_key_pem
  sensitive   = true
}
