# data "digitalocean_domain" "default" {
#   name = "jeremystuart.ca"
# }

# resource "digitalocean_record" "web1" {
#   domain = data.digitalocean_domain.default.id
#   type   = "A"
#   name   = "web1"
#   value  = google_compute_global_address.ingress_webchalls.address
# }

# resource "digitalocean_record" "web2" {
#   domain = data.digitalocean_domain.default.id
#   type   = "A"
#   name   = "web2"
#   value  = google_compute_global_address.ingress_webchalls.address
# }

# resource "digitalocean_record" "web3" {
#   domain = data.digitalocean_domain.default.id
#   type   = "A"
#   name   = "web3"
#   value  = google_compute_global_address.ingress_webchalls.address
# }

# resource "digitalocean_record" "ctfd" {
#   domain = data.digitalocean_domain.default.id
#   type = "A"
#   name = "ctfd"
#   value = google_compute_global_address.ctfd.address
# }

resource "google_compute_global_address" "ingress_webchalls" {
  name = "ingress-webchalls"
  address_type = "EXTERNAL"
  project = var.project_name
  ip_version = "IPV4"
}

resource "google_compute_global_address" "ctfd" {
  name = "ctfd"
  address_type = "EXTERNAL"
  project = var.project_name
  ip_version = "IPV4"
}

resource "google_dns_managed_zone" "ctf_dns" {
  name = "ctf-zone"
  dns_name = "jstuart.ca."
}

resource "google_dns_record_set" "web1" {
  name = "web1.${google_dns_managed_zone.ctf_dns.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.ctf_dns.name

  rrdatas = google_compute_global_address.ingress_webchalls.address
}