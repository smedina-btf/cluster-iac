resource "google_compute_managed_ssl_certificate" "ssl_certificate" {
  name  = "${var.project}-ssl"

  managed {
    domains = [var.domain]
  }
}
