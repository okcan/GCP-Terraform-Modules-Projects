resource "google_sql_database_instance" "default" {
  name             = var.name
  database_version = "POSTGRES_13"
  region           = var.region

deletion_protection = false  # ❗ bu satırı ekle
  settings {
    tier = var.tier
  }
}
