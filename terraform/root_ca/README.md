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
| [tls_private_key.rsa_private_key](https://registry.terraform.io/providers/hashicorp/tls/4.1.0/docs/resources/private_key) | resource |
| [tls_self_signed_cert.root_ca](https://registry.terraform.io/providers/hashicorp/tls/4.1.0/docs/resources/self_signed_cert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ca_cert_pem"></a> [ca\_cert\_pem](#input\_ca\_cert\_pem) | n/a | `string` | `null` | no |
| <a name="input_ca_private_key_pem"></a> [ca\_private\_key\_pem](#input\_ca\_private\_key\_pem) | n/a | `string` | `null` | no |
| <a name="input_subject"></a> [subject](#input\_subject) | Subject object to be used by cert, common name is mandatory | <pre>object({<br>    common_name         = string<br>    country             = optional(string)<br>    email_address       = optional(string)<br>    locality            = optional(string)<br>    organization        = optional(string)<br>    organizational_unit = optional(string)<br>    postal_code         = optional(string)<br>    province            = optional(string)<br>    serial_number       = optional(string)<br>    street_address      = optional(list(string))<br>  })</pre> | n/a | yes |
| <a name="input_validity_period"></a> [validity\_period](#input\_validity\_period) | How long, in hours, is the cert valid for | `number` | `168` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ca_certificate"></a> [ca\_certificate](#output\_ca\_certificate) | Self-signed certificate created as root ca |
| <a name="output_ca_expiration_date"></a> [ca\_expiration\_date](#output\_ca\_expiration\_date) | Expiration date of root ca |
| <a name="output_ca_private_key"></a> [ca\_private\_key](#output\_ca\_private\_key) | Private key of root ca used to sign cert 