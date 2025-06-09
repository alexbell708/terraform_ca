output "root_ca" {
  description = "Root CA pem"
  value       = module.root_ca.ca_certificate
}

resource "local_file" "root_ca" {
  filename = "${path.module}/output/root-ca.cert"
  content  = module.root_ca.ca_certificate
}


output "root_ca_expiration_date" {
  description = "Expiration date of root ca"
  value       = module.root_ca.ca_expiration_date
}

output "sub_ca" {
  description = "Sub CA pem"
  value       = module.sub_ca.certificate
}

resource "local_file" "sub_ca" {
  filename = "${path.module}/output/sub-ca.cert"
  content  = module.sub_ca.certificate
}

output "sub_ca_expiration_date" {
  description = "Expiration date of sub ca"
  value       = module.sub_ca.certificate_expiration_date
}

output "server_cert" {
  description = "Output each server certificate created"
  value = {
    for domain, mod in module.server_cert :
    domain => mod.certificate
  }
}

resource "local_file" "server_cert" {
  for_each = module.server_cert
  filename = "${path.module}/output/${each.key}.cert"
  content  = each.value.certificate
}


output "server_expirary_daye" {
  description = "Expirary date of each server cert"
  value = {
    for domain, cert in module.server_cert :
    domain => cert.certificate_expiration_date
  }
}
