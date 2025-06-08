run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "create_cert_10_year_validity" {
  command = apply

  variables {
    root_ca_validity_years = 10
    root_ca_subject = {
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
    condition = tls_self_signed_cert.root_ca.is_ca_certificate == true
    error     = "A ca has not been created"
  }

  # check allowed uses are correct for root ca
  assert {
    condition = tls_self_signed_cert.root_ca.allowed_uses == ["cert_signing", "crl_signing"]
    error     = "Incorrect allowed uses for a root ca"
  }
}
