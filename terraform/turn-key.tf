# VMs to run the turn-key challenge

# LA: us-west2
# Finalnd: europe-north1
# Dehli: asia-south2

variable "machine-type" {
  description = "Type of GCE machine to create"
  default     = "e2-micro"
}

variable "number-of-servers" {
  description = "The number of servers running the turn-key protocol"
  default     = 3
}

variable "protocol-time" {
  description = "The time in which the protocol needs to be completed"
  default     = 300
}

variable "key-period" {
  description = "How long before the keys get rotated"
  default     = 1200
}

variable "server-number-location" {
  description = "Key pairs for the server number and the location for it's deployment"
  type        = map(any)
  default = {
    us-west2-a      = 1, # LA
    europe-north1-a = 2, # Finland
    asia-south2-a   = 3  # Dehli
  }
}

resource "google_compute_instance" "turn-key" {
  for_each     = var.server-number-location # create a server for each location in the variable above
  project      = var.project_name
  name         = "server-${each.value}"
  zone         = each.key
  machine_type = var.machine-type

  tags = ["turn-key"]

  boot_disk {
    initialize_params {
      image = "turn-key-image"
    }
  }

  network_interface {
    network =  google_compute_network.turn-key.self_link
    access_config {

    }
  }

  # start process and background it
  metadata_startup_script = "java -jar /home/turn-key/turn-key.jar 5555 ${each.value} ${var.number-of-servers} ${var.key-period} ${var.protocol-time} &"
}

# create a separate network for the turn-key servers
resource "google_compute_network" "turn-key" {
  project                 = var.project_name
  name                    = "turn-key"
  auto_create_subnetworks = true

}

# allow traffic over port 5555 for the turn-key servers
resource "google_compute_firewall" "turn-key-egress" {
  name    = "turn-key-egress"
  network = google_compute_network.turn-key.name
  direction = "EGRESS"

  allow {
    protocol = "tcp"
    ports    = ["5555", "22"]
  }

  source_tags = ["turn-key"]
  target_tags = ["turn-key"]
}

resource "google_compute_firewall" "turn-key-ingress" {
  name    = "turn-key-ingress"
  network = google_compute_network.turn-key.name
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["5555", "22"]
  }

  source_tags = ["turn-key"]
  target_tags = ["turn-key"]
}