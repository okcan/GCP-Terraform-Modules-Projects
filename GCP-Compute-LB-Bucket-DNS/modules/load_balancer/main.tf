resource "google_compute_health_check" "default" {
  name = "${var.backend_service}-hc"
  http_health_check {
    port = 80
  }
}

resource "google_compute_backend_service" "default" {
  name                            = var.backend_service
  protocol                        = "HTTP"
  port_name                       = "http"
  health_checks                   = [google_compute_health_check.default.id]
  backend {
    group = var.instance_group
  }
}

resource "google_compute_url_map" "default" {
  name            = var.url_map_name
  default_service = google_compute_backend_service.default.id
}

resource "google_compute_target_http_proxy" "default" {
  name   = var.proxy_name
  url_map = google_compute_url_map.default.id
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = var.forwarding_rule
  target     = google_compute_target_http_proxy.default.id
  port_range = "80"
}