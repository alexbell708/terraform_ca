variable "sub_ca_validity_years" {
  description = "How many years is sub ca valid? 5 or 10. Defaults to 5 years"
  type        = number
  default     = 5

  validation {
    condition     = contains([5, 10], var.sub_ca_validity_years)
    error_message = "root ca must be valid for 5 or 10 years"
  }
}

variable "root_ca_private_key" {
  description = "Private key of root ca"
  type        = string
  sensitive   = true
}

variable "root_ca_cert" {
  description = "Root CA cert"
  type        = string
}

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

