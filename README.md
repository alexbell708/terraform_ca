# terraform_ca
Creates a self-signed certificate as a Root CA

Creates a Sub CA - signed by the root CA

Allows for the creation of of short-lived server certificates, signed by the Sub CA, with automatic certificate rotation every 7 days

All certificate names throughout should be controlled by variables

Server certificates should also allow input for subject alternative naming details, such as different DNS records or IP information

Star based certificates are not allowed and should be rejected if supplied as variable input