provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "network" {
  source       = "./modules/network"
  network_name = "main-vpc"
  subnet_name  = "main-subnet"
  region       = var.region
}

module "iam" {
  source           = "./modules/iam"
  project_id       = var.project_id
  service_accounts = ["vm-service-account@${var.project_id}.iam.gserviceaccount.com"]
}

module "compute" {
  source            = "./modules/compute"
  instance_name     = "my-vm"
  machine_type      = "e2-medium"
  zone              = var.zone
  network_self_link = module.network.network_self_link
  subnet_self_link  = module.network.subnet_self_link
  service_account   = "vm-service-account@${var.project_id}.iam.gserviceaccount.com"
}