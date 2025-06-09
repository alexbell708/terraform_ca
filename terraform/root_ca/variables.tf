variable "validity_period" {
  description = "How long, in hours, is the cert valid for"
  type        = number
  default     = 168
}

variable "subject" {
  description = "Subject object to be used by cert, common name is mandatory"
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

variable "ca_private_key_pem" {
  type      = string
  default   = null
  sensitive = true
}

variable "ca_cert_pem" {
  type    = string
  default = null
}
