resource "google_container_cluster" "primary" {
  count = var.gke_enabled ? 1 : 0

  name     = "k8s-ctf-cluster"
  location = "us-central1-a"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  dns_config {
    cluster_dns = "CLOUD_DNS"
    cluster_dns_scope = "VPC_SCOPE"
    cluster_dns_domain = ".jstuart.ca"
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  count = var.gke_enabled ? 1 : 0

  name       = "k8s-ctf-node-pool"
  location   = "us-central1-a"
  cluster    = google_container_cluster.primary[count.index].name
  node_count = var.node_count

  node_config {
    preemptible  = true
    machine_type = "e2-small"
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]
  }
}
