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

