# terraform-ssl-vultr

Standalone:

1. Fill out `ssl.env` and source it: `$ source ssl.env`
2. `$ terraform init; terraform validate`
3. `$ terraform apply`

Import as module:

```
module "vultr-ssl" {
  source  = "git::https://github.com/Oogy/terraform-ssl-vultr.git?ref=v1.0.0"

#  acme_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
  acme_url    = "https://acme-v02.api.letsencrypt.org/directory"
  acme_email  = "email@gmail.com"
  cert_domain = "some.domain"
  cert_san    = ["*.some.domain"]
}

```
