resource "google_dns_managed_zone" "default" {
  name     = var.zone_name
  dns_name = var.domain
}