resource "google_dns_managed_zone" "cluster-iac-dns" {
  name     = "${var.project}-dns"
  dns_name = "${var.domain}."
}

resource "google_dns_record_set" "cluster-dns-set" {
  name = google_dns_managed_zone.cluster-iac-dns.dns_name
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.cluster-iac-dns.name

  rrdatas = [google_container_cluster.primary.endpoint]
}
