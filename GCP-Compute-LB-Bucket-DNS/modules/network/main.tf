resource "google_compute_network" "vpc_network" {
  name = var.network_id
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_id
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}