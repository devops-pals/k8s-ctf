resource "google_artifact_registry_repository" "docker_artifact_registry" {
  provider = google-beta

  location = "us-central1"
  repository_id = "docker-repo"
  description = "Repository for storing docker images"
  format = "DOCKER"
  depends_on = [google_project_service.artifactregistry_googleapis_com]
}

resource "google_project_service" "artifactregistry_googleapis_com" {
  project = "k8s-ctf-345001"
  service = "artifactregistry.googleapis.com"
}

resource "google_artifact_registry_repository" "helm_artifact_registry" {
  provider = google-beta

  location = "us-central1"
  repository_id = "docker-repo"
  description = "Repository for storing helm charts"
  format = "HELM"
  depends_on = [google_project_service.artifactregistry_googleapis_com]
}
