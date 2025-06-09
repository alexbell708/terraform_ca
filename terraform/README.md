## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_root_ca"></a> [root\_ca](#module\_root\_ca) | ./root_ca | n/a |
| <a name="module_server_cert"></a> [server\_cert](#module\_server\_cert) | ./certificates | n/a |
| <a name="module_sub_ca"></a> [sub\_ca](#module\_sub\_ca) | ./certificates | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.root_ca](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.server_cert](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.sub_ca](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_root_ca_cn"></a> [root\_ca\_cn](#input\_root\_ca\_cn) | Common name for root CA | `string` | n/a | yes |
| <a name="input_server_cn"></a> [server\_cn](#input\_server\_cn) | Set of common names for server certificates | `set(string)` | n/a | yes |
| <a name="input_sub_ca_cn"></a> [sub\_ca\_cn](#input\_sub\_ca\_cn) | Common name for sub CA | `string` | n/a | yes |
| <a name="input_subject"></a> [subject](#input\_subject) | Subject object to be used by certs | <pre>object({<br>    country             = optional(string)<br>    email_address       = optional(string)<br>    locality            = optional(string)<br>    organization        = optional(string)<br>    organizational_unit = optional(string)<br>    postal_code         = optional(string)<br>    province            = optional(string)<br>    serial_number       = optional(string)<br>    street_address      = optional(list(string))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_root_ca"></a> [root\_ca](#output\_root\_ca) | Root CA pem |
| <a name="output_root_ca_expiration_date"></a> [root\_ca\_expiration\_date](#output\_root\_ca\_expiration\_date) | Expiration date of root ca |
| <a name="output_server_cert"></a> [server\_cert](#output\_server\_cert) | Output each server certificate created |
| <a name="output_server_expirary_daye"></a> [server\_expirary\_daye](#output\_server\_expirary\_daye) | Expirary date of each server cert |
| <a name="output_sub_ca"></a> [sub\_ca](#output\_sub\_ca) | Sub CA pem |
| <a name="output_sub_ca_expiration_date"></a> [sub\_ca\_expiration\_date](#output\_sub\_ca\_expiration\_date) | Expiration date of sub ca |