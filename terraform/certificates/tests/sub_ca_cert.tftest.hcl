run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "create_root_ca" {
  module {
    source = "../root_ca"
  }

  variables {
    subject = {
      common_name = "test"
    }

    validity_period = 24
  }
}

run "create_sub_ca" {
  command = apply

  variables {
    validity_period = run.setup_tests.validity_period
    subject = {
      common_name = run.setup_tests.common_name
    }

    is_ca_certificate  = true
    ca_private_key_pem = run.create_root_ca.ca_private_key
    ca_cert_pem        = run.create_root_ca.ca_certificate
  }

  # check validity period is mapped correctly
  assert {
    condition     = tls_locally_signed_cert.cert.validity_period_hours == tonumber(run.setup_tests.validity_period)
    error_message = "Validity period has not been mapped correctly"
  }

  # check that cert created is ca
  assert {
    condition     = tls_locally_signed_cert.cert.is_ca_certificate == true
    error_message = "A ca has not been created"
  }

  # check ca is outputted
  assert {
    condition     = output.certificate != ""
    error_message = "CA has not been outputted from module"
  }

  # check expiration date is outputted
  assert {
    condition     = output.certificate_expiration_date != ""
    error_message = "CA expiration date has not been outputted from module"
  }

}
