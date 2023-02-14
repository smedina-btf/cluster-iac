locals {
  apis = [
    "servicemanagement.googleapis.com","storage-api.googleapis.com","pubsub.googleapis.com", "run.googleapis.com",
    "compute.googleapis.com", "secretmanager.googleapis.com", "vpcaccess.googleapis.com", "cloudbuild.googleapis.com",
    "monitoring.googleapis.com", "artifactregistry.googleapis.com", "iamcredentials.googleapis.com",
    "sourcerepo.googleapis.com"
  ]
}

resource "google_project_service" "api_services" {
  for_each = toset(local.apis)
  project  = var.project
  service  = each.value

  disable_dependent_services = true
}
