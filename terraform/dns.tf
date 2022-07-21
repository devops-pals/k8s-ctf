data "digitalocean_domain" "default" {
  name = "scriptkitties.dev"
}

resource "digitalocean_record" "web1" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "web1"
  value  = google_compute_address.ingress_webchalls.address
}

resource "digitalocean_record" "web2" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "web2"
  value  = google_compute_address.ingress_webchalls.address
}

resource "digitalocean_record" "web3" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "web3"
  value  = google_compute_address.ingress_webchalls.address
}

resource "google_compute_address" "ingress_webchalls" {
  name = "ingress-webchalls"
}