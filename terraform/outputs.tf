output "sql_instance" {
  value = google_sql_database_instance.sql_instance.private_ip_address
}

output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}
