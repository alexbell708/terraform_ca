resource "tls_private_key" "rsa-private-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
