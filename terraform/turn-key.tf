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
  type = map
  default = {
    us-west2-a = 1,      # LA
    europe-north1-a = 2, # Finland
    asia-south2-a = 3    # Dehli
  }
}

resource "google_compute_instance" "turn-key" {
  for_each     = var.server-number-location
  project      = var.project_name
  name         = "server-${each.value}"
  zone         = each.key
  machine_type = var.machine-type

  tags = ["networks", "turn-key"]

  boot_disk {
    initialize_params {
      image = "turn-key-image"
    }
  }

   network_interface {
    network = "default"
    access_config {
      
    }
   }

  # start process and background it
  metadata_startup_script = "java -jar /home/turn-key/turn-key.jar 5555 ${each.value} ${var.number-of-servers} ${var.key-period} ${var.protocol-time} &"
}