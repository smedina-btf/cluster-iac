resource "google_compute_url_map" "url_map" {
  name            = "${var.project}-lb"
  default_service = google_compute_backend_service.default.self_link
  depends_on      = [google_compute_backend_service.default]
}

resource "google_compute_target_https_proxy" "https_proxy" {
  name              = "${var.project}-https-proxy"
  url_map           = google_compute_url_map.url_map.self_link
  ssl_certificates  = [google_compute_managed_ssl_certificate.ssl_certificate.self_link]

  depends_on        = [google_compute_url_map.url_map, google_compute_managed_ssl_certificate.ssl_certificate]
}

resource "google_compute_backend_service" "default" {
  name          = "${var.project}-bs"
  health_checks = [google_compute_health_check.default.self_link]
  load_balancing_scheme = "EXTERNAL_MANAGED"

  backend {
    group = google_compute_network_endpoint_group.neg.id
  }
}

resource "google_compute_health_check" "default" {
  name               = "${var.project}-hc"
  check_interval_sec = 60
  timeout_sec        = 60
  tcp_health_check {
    port = "80"
  }
}
