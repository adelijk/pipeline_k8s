variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "node_machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
}

variable "node_disk_size" {
  description = "Disk size for GKE nodes in GB"
  type        = number
}

variable "initial_node_count" {
  description = "Initial number of nodes in the GKE cluster"
  type        = number
}

variable "artifact_repo_name" {
  description = "Name of the Artifact Registry repository"
  type        = string
}


variable "zone" {
  description = "used zone"
  type        = string
}