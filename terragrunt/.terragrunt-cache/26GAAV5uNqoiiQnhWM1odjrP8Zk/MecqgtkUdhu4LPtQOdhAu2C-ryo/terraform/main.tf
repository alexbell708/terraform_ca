module "root_ca" {
  source = "./root_ca"
  subject = merge(var.subject, {
    common_name = var.root_ca_cn
  })
  validity_period = 87660
}

module "sub_ca" {
  source = "./certificates"
  subject = merge(var.subject, {
    common_name = var.sub_ca_cn
  })
  validity_period    = 43830
  ca_cert_pem        = module.root_ca.ca_certificate
  ca_private_key_pem = module.root_ca.ca_private_key
  is_ca_certificate  = true
}

module "server_cert" {
  for_each = var.server_cn
  source   = "./certificates"
  subject = merge(var.subject, {
    common_name = each.key
  })
  ca_cert_pem        = module.sub_ca.certificate
  ca_private_key_pem = module.sub_ca.certificate_private_key

  dns_names = [each.key]
}
