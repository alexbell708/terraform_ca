## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tls_cert_request.csr](https://registry.terraform.io/providers/hashicorp/tls/4.1.0/docs/resources/cert_request) | resource |
| [tls_locally_signed_cert.cert](https://registry.terraform.io/providers/hashicorp/tls/4.1.0/docs/resources/locally_signed_cert) | resource |
| [tls_private_key.rsa_private_key](https://registry.terraform.io/providers/hashicorp/tls/4.1.0/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ca_cert_pem"></a> [ca\_cert\_pem](#input\_ca\_cert\_pem) | CA used to sign cert | `string` | `null` | no |
| <a name="input_ca_private_key_pem"></a> [ca\_private\_key\_pem](#input\_ca\_private\_key\_pem) | Private key for CA used to sign cert | `string` | n/a | yes |
| <a name="input_cert_type"></a> [cert\_type](#input\_cert\_type) | Which type of certificate is being created: root\_ca, sub\_ca or server | `string` | n/a | yes |
| <a name="input_dns_names"></a> [dns\_names](#input\_dns\_names) | n/a | `list(string)` | `[]` | no |
| <a name="input_ip_addresses"></a> [ip\_addresses](#input\_ip\_addresses) | n/a | `list(string)` | `[]` | no |
| <a name="input_is_ca_certificate"></a> [is\_ca\_certificate](#input\_is\_ca\_certificate) | Is this a sub ca or a server certificate | `bool` | `false` | no |
| <a name="input_subject"></a> [subject](#input\_subject) | Subject object to be used by cert, common name is mandatory | <pre>object({<br>    common_name         = string<br>    country             = optional(string)<br>    email_address       = optional(string)<br>    locality            = optional(string)<br>    organization        = optional(string)<br>    organizational_unit = optional(string)<br>    postal_code         = optional(string)<br>    province            = optional(string)<br>    serial_number       = optional(string)<br>    street_address      = optional(list(string))<br>  })</pre> | n/a | yes |
| <a name="input_validity_period"></a> [validity\_period](#input\_validity\_period) | How long, in hours, is the cert valid for | `number` | `168` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate"></a> [certificate](#output\_certificate) | Certificate signed by CA |
| <a name="output_certificate_expiration_date"></a> [certificate\_expiration\_date](#output\_certificate\_expiration\_date) | Expiration date of certificate |
| <a name="output_certificate_private_key"></a> [certificate\_private\_key](#output\_certificate\_private\_key) | Private key of certificate |