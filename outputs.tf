output "certificate" {
  value = acme_certificate.cert.certificat_pem
}

output "private_key" {
  value     = tls_private_key.private_key.private_key_pem
  sensitive = true
}
