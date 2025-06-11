resource "google_compute_instance_template" "template" {
  name         = var.instance_template_name
  machine_type = "e2-medium"
  region       = var.region

  disk {
    source_image = var.image
    auto_delete  = true
    boot         = true
  }

  service_account {
    email  = var.service_account
    scopes = ["cloud-platform"]
  }

  network_interface {
    subnetwork = var.subnet
    access_config {}
  }

  metadata_startup_script = "#!/bin/bash\necho Hello, World > /var/www/html/index.html"
}

resource "google_compute_region_instance_group_manager" "group" {
  name               = var.group_name
  region             = var.region
  base_instance_name = "content-instance"
  version {
    instance_template = google_compute_instance_template.template.id
  }
  target_size = 2
}