variable "subject" {
  description = "Subject object to be used by certs"
  type = object({
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

variable "root_ca_cn" {
  description = "Common name for root CA"
  type        = string
}

variable "sub_ca_cn" {
  description = "Common name for sub CA"
  type        = string
}

variable "server_cn" {
  description = "Set of common names for server certificates"
  type        = set(string)
}
