variable "cert_type" {
  description = "Which type of certificate is being created: root_ca, sub_ca or server"
  type        = string
  validation {
    condition     = contains(["root_ca", "sub_ca", "server"], var.cert_type)
    error_message = "Cert type must be root_ca, sub_ca or server"
  }
}

variable "validity_period" {
  description = "How long, in hours, is the cert valid for"
  type        = number
  default     = 168 // 7 days
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
  description = "Private key for CA used to sign cert"
  type        = string
  sensitive   = true
}

variable "ca_cert_pem" {
  description = "CA used to sign cert"
  type        = string
  default     = null
}

variable "is_ca_certificate" {
  description = "Is this a sub ca or a server certificate"
  type        = bool
  default     = false
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
