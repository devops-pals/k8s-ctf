terraform {
  cloud {
    organization = "devops-pals"

    workspaces {
      name = "k8s-ctf"
    }
  }
}

provider "google" {
  project = "k8s-ctf-345001"
  region = "us-central1"
  zone = "us-central1-a"
}

provider "google-beta" {
  project = "k8s-ctf-345001"
  region = "us-central1"
  zone = "us-central1-a"
}
