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
| [tls_cert_request.sub_ca_csr](https://registry.terraform.io/providers/hashicorp/tls/4.1.0/docs/resources/cert_request) | resource |
| [tls_locally_signed_cert.sub_ca](https://registry.terraform.io/providers/hashicorp/tls/4.1.0/docs/resources/locally_signed_cert) | resource |
| [tls_private_key.rsa_private_key](https://registry.terraform.io/providers/hashicorp/tls/4.1.0/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_root_ca_cert"></a> [root\_ca\_cert](#input\_root\_ca\_cert) | Root CA cert | `string` | n/a | yes |
| <a name="input_root_ca_private_key"></a> [root\_ca\_private\_key](#input\_root\_ca\_private\_key) | Private key of root ca | `string` | n/a | yes |
| <a name="input_sub_ca_validity_years"></a> [sub\_ca\_validity\_years](#input\_sub\_ca\_validity\_years) | How many years is sub ca valid? 5 or 10. Defaults to 5 years | `number` | `5` | no |
| <a name="input_subject"></a> [subject](#input\_subject) | Subject object to be used by sub ca, common name is mandatory | <pre>object({<br>    common_name         = string<br>    country             = optional(string)<br>    email_address       = optional(string)<br>    locality            = optional(string)<br>    organization        = optional(string)<br>    organizational_unit = optional(string)<br>    postal_code         = optional(string)<br>    province            = optional(string)<br>    serial_number       = optional(string)<br>    street_address      = optional(list(string))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sub_ca_certificate"></a> [sub\_ca\_certificate](#output\_sub\_ca\_certificate) | Sub CA signed by local root CA |
| <a name="output_sub_ca_expiration_date"></a> [sub\_ca\_expiration\_date](#output\_sub\_ca\_expiration\_date) | Expiration date of sub ca |
| <a name="output_sub_ca_private_key"></a> [sub\_ca\_private\_key](#output\_sub\_ca\_private\_key) | Private key of sub ca used to sign sub ca cert |