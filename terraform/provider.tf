terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  cloud {
    organization = "devops-pals"

    workspaces {
      name = "k8s-ctf-terraform"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

provider "google" {
  project = "k8s-ctf-345001"
  region  = "us-central1"
  zone    = "us-central1-a"
}

provider "google-beta" {
  project = "k8s-ctf-345001"
  region  = "us-central1"
  zone    = "us-central1-a"
}
