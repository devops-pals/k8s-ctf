variable "gke_enabled" {
  type    = bool
  default = false
}

variable "dns_enabled" {
  type    = bool
  default = false
}

variable "docker_registry_enabled" {
  type    = bool
  default = false
}

variable "helm_registry_enabled" {
  type    = bool
  default = false
}

variable "node_count" {
  type = number
  default = 1
}

variable "project_name" {
  type = string
  default = "k8s-ctf-345001"
}