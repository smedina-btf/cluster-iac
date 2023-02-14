resource "google_service_account" "bastion" {
  account_id   = "${var.project}-bastion"
  display_name = "Service Account Bastion GKE"
}

resource "google_compute_instance" "bastion" {
  name         = "bastion-vm"
  machine_type = "e2-micro"
  zone         = "${var.region}-b"
  tags         = ["bastion"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  network_interface {
    subnetwork = var.subnet

    access_config {
      network_tier = "STANDARD"
    }
  }

  allow_stopping_for_update = true

  service_account {
    email  = google_service_account.bastion.email
    scopes = ["cloud-platform"]
  }
}
