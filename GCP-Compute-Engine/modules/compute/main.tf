variable "instance_name" {}
variable "machine_type" {}
variable "zone" {}
variable "network_self_link" {}
variable "subnet_self_link" {}
variable "service_account" {}

resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = var.network_self_link
    subnetwork = var.subnet_self_link
    access_config {}
  }

  service_account {
    email  = var.service_account
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt update
    sudo apt install -y nginx
  EOT
}

output "instance_name" {
  value = google_compute_instance.default.name
}