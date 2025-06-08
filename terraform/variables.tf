variable "root_ca_validity_years" {
  description = "How many years is root ca valid? 10, 20 or 25 years. Defaults to 10 yearsS"
  type        = number
  default     = 10

  validation {
    condition     = contains([10, 20, 25], var.root_ca_validity_years)
    error_message = "root ca must be valid for 10, 20 or 25 years"
  }
}

variable "root_ca_subject" {
  description = "Subject object to be used by root ca, common name is mandatory"
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
