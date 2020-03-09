provider "acme" {
  server_url = var.acme_url
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.tpot_private_key.private_key_pem
  email_address   = var.acme_email
}

resource "acme_certificate" "cert" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = var.cert_domain
  subject_alternative_names = var.cert_san
  key_type                  = 4096

  dns_challenge {
    provider = "vultr"
  }
}

