provider "google" {
  project = var.project_id
  region  = var.region
}

# Create GKE cluster
resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.zone

  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = var.node_disk_size
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  initial_node_count = var.initial_node_count
}


# Create Artifact Registry for Docker images
resource "google_artifact_registry_repository" "artifact_repo" {
  repository_id= var.artifact_repo_name
  format       = "DOCKER"
  location     = var.region
  description  = "Artifact Registry for storing Docker images"
}

# Create Google Cloud Storage bucket for storing Terraform state
  resource "google_storage_bucket" "terraform_state_bucket" {
  name          = "${var.project_id}-terraform-state"
  location      = var.region
  storage_class = "STANDARD"

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }
}
