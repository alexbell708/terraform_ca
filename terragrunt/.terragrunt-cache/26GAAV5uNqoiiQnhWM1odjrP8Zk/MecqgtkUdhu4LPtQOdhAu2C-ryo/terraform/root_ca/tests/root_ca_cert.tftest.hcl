run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "create_root_ca" {
  command = apply

  variables {
    validity_period = 87660
    subject = {
      common_name = run.setup_tests.common_name
    }
  }

  # check validity period is 10 years
  assert {
    condition     = tls_self_signed_cert.root_ca.validity_period_hours == 87660
    error_message = "Incorrect validity period - should be 877660 for 10 years"
  }

  # check common name is the same as test value
  assert {
    condition     = tls_self_signed_cert.root_ca.subject[0].common_name == run.setup_tests.common_name
    error_message = "Common name has not been correctly mapped"
  }

  # check that cert created is root ca
  assert {
    condition     = tls_self_signed_cert.root_ca.is_ca_certificate == true
    error_message = "A ca has not been created"
  }

  # check ca is outputted
  assert {
    condition     = output.ca_certificate != ""
    error_message = "CA has not been outputted from module"
  }

  # check expiration date is outputted
  assert {
    condition     = output.ca_expiration_date != ""
    error_message = "CA expiration date has not been outputted from module"
  }
}
