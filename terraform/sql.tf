resource "google_sql_database_instance" "sql_instance" {
  name             = "${var.project}-sql"
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }  
}