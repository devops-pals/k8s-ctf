# project to run the GCE packer process
variable "project" {
  default = "k8s-ctf-345001"
}

# zone to run the packer process
variable "zone" {
  default = "us-central1-a"
}

# built on ubuntu 20.04 minimal
variable "source_image" {
  default = "ubuntu-2004-focal-v20230302"
}

# output image name
variable "image_name" {
  default = "turn-key-image"
}


source "googlecompute" "turn-key-base" {
  account_file = "access-key.json"
  project_id   = var.project
  source_image = var.source_image
  ssh_username = "ubuntu"
  zone         = var.zone
  disk_size    = 10
  disk_type    = "pd-ssd"
  image_name   = var.image_name
}

build {
  sources = ["sources.googlecompute.turn-key-base"]

  # update the image and install java
  provisioner "shell" {
    inline = [
      "sudo apt update -y",
      "sudo apt install openjdk-8-jdk -y",
      "sudo mkdir /home/turn-key/",
      "sudo chown ubuntu:ubuntu /home/turn-key" 
    ]
  }

  # copy the turn-key binary over to the image
  provisioner "file" {
    source      = "turn-key.jar"
    destination = "/home/turn-key/turn-key.jar"
  }

  provisioner "file" {
    source = "startup-script.sh"
    destination = "/home/turn-key/startup-script.sh"
  }

  # run the cron script to add the startup command for running the binary at startup
  provisioner "shell" {
    script = "cron-script.sh"
  }
}