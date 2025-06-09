variable "subject" {
  description = "Subject object to be used by sub ca, common name is mandatory"
  type = object({
    common_name         = string
    country             = optional(string)
    email_address       = optional(string)
    locality            = optional(string)
    organization        = optional(string)
    organizational_unit = optional(string)
    postal_code         = optional(string)
    province            = optional(string)
    serial_number       = optional(string)
    street_address      = optional(list(string))
  })
}


variable "dns_names" {
  type    = list(string)
  default = []

  validation {
    condition = alltrue([
      for name in var.dns_names : !can(regex("^\\*\\.", name))
    ])
    error_message = "Star based certificates are not allowed"
  }
}

variable "ip_addresses" {
  type    = list(string)
  default = []
}

variable "ca_private_key_pem" {
  type = string
}

variable "ca_cert_pem" {
  type = string
}
