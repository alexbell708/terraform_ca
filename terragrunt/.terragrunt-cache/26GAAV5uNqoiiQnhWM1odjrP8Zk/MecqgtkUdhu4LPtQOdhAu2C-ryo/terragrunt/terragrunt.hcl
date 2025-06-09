terraform {
    source = "..//terraform"
}

inputs = {
    subject = {
        country         = "GB"
        email           = "alex@certs.com"
        organization    = "certs" 
    }

    root_ca_cn  = "root-ca"
    sub_ca_cn   = "sub-ca"
    server_cn   = ["www.alex.com", "alex.com", "api.alex.com"]
}