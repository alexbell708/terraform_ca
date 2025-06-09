resource "tls_private_key" "rsa_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
