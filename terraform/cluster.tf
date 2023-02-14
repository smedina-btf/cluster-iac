resource "google_service_account" "default" {
  account_id   = "${var.project}-account-id"
  display_name = "Service Account GKE"
}

resource "google_container_cluster" "primary" {
  name               = "${var.project}-cluster"
  location           = "${var.region}-b"
  initial_node_count = 3
  network = "default"
  subnetwork = "default"

  node_config {
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}

resource "google_compute_network_endpoint_group" "neg" {
  name         = "${var.project}-neg"
  network      = "default"
  network_endpoint_type = "GCE_VM_IP_PORT"
  subnetwork   = "default"
  default_port = "80"
  zone         = "${var.region}-b"
}
