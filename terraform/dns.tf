data "digitalocean_domain" "default" {
  name = "jeremystuart.ca"
}

resource "digitalocean_record" "web1" {
  domain = data.digitalocean_domain.default.id
  type   = "A"
  name   = "web1"
  value  = google_compute_global_address.ingress_webchalls.address
}

resource "digitalocean_record" "web2" {
  domain = data.digitalocean_domain.default.id
  type   = "A"
  name   = "web2"
  value  = google_compute_global_address.ingress_webchalls.address
}

resource "digitalocean_record" "web3" {
  domain = data.digitalocean_domain.default.id
  type   = "A"
  name   = "web3"
  value  = google_compute_global_address.ingress_webchalls.address
}

resource "digitalocean_record" "ctfd" {
  domain = data.digitalocean_domain.default.id
  type = "A"
  name = "ctfd"
  value = google_compute_global_address.ctfd.address
}

resource "google_compute_global_address" "ingress_webchalls" {
  name = "ingress-webchalls"
  address_type = "EXTERNAL"
}

resource "google_compute_global_address" "ctfd" {
  name = "ctfd"
  address_type = "EXTRENAL"
}