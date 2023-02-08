# DNS Zone
resource "google_dns_managed_zone" "ctf_dns" {
  name = "ctf-zone"
  dns_name = "jstuart.ca."
}

###############################################################################
#
# Web DNS and IP settings
#
###############################################################################

resource "google_compute_global_address" "ingress_webchalls" {
  count = var.dns_enabled ? 1 : 0
  name = "ingress-webchalls"
  address_type = "EXTERNAL"
  project = var.project_name
  ip_version = "IPV4"
}

resource "google_dns_record_set" "web1" {
  count = var.dns_enabled ? 1 : 0
  name = "web1.${google_dns_managed_zone.ctf_dns.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.ctf_dns.name

  rrdatas = [google_compute_global_address.ingress_webchalls.address]
}

resource "google_dns_record_set" "web2" {
  count = var.dns_enabled ? 1 : 0
  name = "web2.${google_dns_managed_zone.ctf_dns.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.ctf_dns.name

  rrdatas = [google_compute_global_address.ingress_webchalls.address]
}

resource "google_dns_record_set" "web3" {
  count = var.dns_enabled ? 1 : 0
  name = "web3.${google_dns_managed_zone.ctf_dns.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.ctf_dns.name

  rrdatas = [google_compute_global_address.ingress_webchalls.address]
}

###############################################################################
#
# CTFd DNS and IP settings
#
###############################################################################

resource "google_compute_global_address" "ctfd-ingress" {
  count = var.dns_enabled ? 1 : 0
  name = "ctfd"
  address_type = "EXTERNAL"
  project = var.project_name
  ip_version = "IPV4"
}

resource "google_dns_record_set" "ctfd" {
  count = var.dns_enabled ? 1 : 0
  name = "ctfd.${google_dns_managed_zone.ctf_dns.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.ctf_dns.name

  rrdatas = [google_compute_global_address.ctfd-ingress.address]
}