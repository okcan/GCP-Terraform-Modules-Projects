# === Terraform Root Module ===

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_service_account" "content_server_sa" {
  account_id   = "content-server-sa"
  display_name = "Content Server Service Account"
}

module "network" {
  source     = "./modules/network"
  region     = var.region
  network_id = "main-vpc"
  subnet_id  = "main-subnet"
}

module "compute" {
  source     = "./modules/compute"
  region     = var.region
  subnet     = module.network.subnet_name
  instance_template_name = "content-server-template"
  group_name = "content-group"
  image      = "ubuntu-os-cloud/ubuntu-2204-lts"
  service_account = google_service_account.content_server_sa.email
}

module "load_balancer" {
  source             = "./modules/load_balancer"
  region             = var.region
  instance_group     = module.compute.instance_group
  backend_service    = "backend-service"
  url_map_name       = "url-map"
  proxy_name         = "http-proxy"
  forwarding_rule    = "http-rule"
}

#module "dns" {
#  source   = "./modules/dns"
#  zone_name = "example-zone"
#  domain    = "example.com."
#}

module "cloud_sql" {
  source = "./modules/cloud_sql"
  region = var.region
  name   = "content-db"
  tier   = "db-f1-micro"
}

module "storage" {
  source     = "./modules/storage"
  bucket_name = "content-server-bucket-${var.project_id}"
  region      = var.region
}

variable "project_id" {}
variable "region"     { default = "us-central1" }
variable "zone"       { default = "us-central1-a" }
