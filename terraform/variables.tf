variable "do_token" {
  type    = string
}

variable "gke_enabled" {
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