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
  default = {
    1 = "us-west2-a",      # LA
    2 = "europe-north1-a", # Finland
    3 = "asia-south2-a"    # Dehli
  }
}

resource "google_compute_instance" "turn-key" {
  for_each     = var.server-number-location
  count        = 1
  project      = var.project_name
  name         = "server-${each.key}"
  zone         = each.value
  machine_type = var.machine-type

  tags = ["networks", "turn-key"]

  boot_disk {
    initialize_params {
      image = "turn-key-image"
    }
  }

   network_interface {
    network = "default"
   }

  # start process and background it
  metadata_startup_script = "java -jar /home/turn-key/turn-key.jar 5555 ${each.key} ${var.number-of-servers} ${var.key-period} ${var.protocol-time} &"
}