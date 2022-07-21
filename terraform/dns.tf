resource "digitalocean_domain" "default" {
  name = "scriptkitties.dev"
}

resource "digitalocean_record" "www" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "www"
  value  = "192.168.0.11"
}