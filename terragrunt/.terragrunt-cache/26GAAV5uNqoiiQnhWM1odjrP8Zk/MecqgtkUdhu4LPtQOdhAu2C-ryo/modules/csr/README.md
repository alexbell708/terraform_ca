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
| [tls_cert_request.ca_csr](https://registry.terraform.io/providers/hashicorp/tls/4.1.0/docs/resources/cert_request) | resource |
| [tls_private_key.rsa_private_key](https://registry.terraform.io/providers/hashicorp/tls/4.1.0/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subject"></a> [subject](#input\_subject) | Subject object to be used by sub ca, common name is mandatory | <pre>object({<br>    common_name         = string<br>    country             = optional(string)<br>    email_address       = optional(string)<br>    locality            = optional(string)<br>    organization        = optional(string)<br>    organizational_unit = optional(string)<br>    postal_code         = optional(string)<br>    province            = optional(string)<br>    serial_number       = optional(string)<br>    street_address      = optional(list(string))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_csr"></a> [csr](#output\_csr) | n/a |