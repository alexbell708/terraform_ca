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
| <a name="input_root_ca_subject"></a> [root\_ca\_subject](#input\_root\_ca\_subject) | Subject object to be used by root ca, common name is mandatory | <pre>object({<br>    common_name         = string<br>    country             = optional(string)<br>    email_address       = optional(string)<br>    locality            = optional(string)<br>    organization        = optional(string)<br>    organizational_unit = optional(string)<br>    postal_code         = optional(string)<br>    province            = optional(string)<br>    serial_number       = optional(string)<br>    street_address      = optional(list(string))<br>  })</pre> | n/a | yes |
| <a name="input_root_ca_validity_years"></a> [root\_ca\_validity\_years](#input\_root\_ca\_validity\_years) | How many years is root ca valid? 10, 20 or 25 years. Defaults to 10 yearsS | `number` | `10` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_root_ca_certificate"></a> [root\_ca\_certificate](#output\_root\_ca\_certificate) | Self-signed certificate created as root ca |
| <a name="output_root_ca_expiration_date"></a> [root\_ca\_expiration\_date](#output\_root\_ca\_expiration\_date) | Expiration date of root ca |
| <a name="output_root_ca_private_key"></a> [root\_ca\_private\_key](#output\_root\_ca\_private\_key) | Private key of root ca used to sign sub ca cert |