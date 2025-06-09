run "setup_tests" {
  module {
    source = "../root_ca"
  }

  variables {
    root_ca_subject = {
      common_name = "test"
    }

    root_ca_validity_years = 10
  }
}

run "create_sub_ca" {
  command = apply

  variables {
    sub_ca_validity_years = 5
    subject = {
      common_name = "sub-ca"
    }
    root_ca_private_key = run.setup_tests.root_ca_private_key
    root_ca_cert        = run.setup_tests.root_ca_certificate
  }

  # check validity period is 5 years
  assert {
    condition     = tls_locally_signed_cert.sub_ca.validity_period_hours == 43830
    error_message = "Incorrect validity period - should be 43830 for 5 years"
  }

  # check that cert created is ca
  assert {
    condition     = tls_locally_signed_cert.sub_ca.is_ca_certificate == true
    error_message = "A ca has not been created"
  }

  # check ca is outputted
  assert {
    condition     = output.sub_ca_certificate != ""
    error_message = "CA has not been outputted from module"
  }

  # check expiration date is outputted
  assert {
    condition     = output.sub_ca_expiration_date != ""
    error_message = "CA expiration date has not been outputted from module"
  }
}
