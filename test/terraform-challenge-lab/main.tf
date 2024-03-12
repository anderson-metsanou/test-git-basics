
provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
}

module "instances" {
  source = "./modules/instances"
}

module "storage" {
  source = "./modules/storage"
}

terraform {
  backend "gcs" {
    bucket  = "tf-bucket-059782"
    prefix  = "terraform/state"
  }
}

module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 8.0.0"

    project_id   = var.project_id
    network_name = "tf-vpc-341038"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-east1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-east1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
        
    ]


}

resource "google_compute_firewall" "rules" {
  project     = var.project_id # Replace this with your project ID in quotes
  name        = "tf-firewall"
  network     = "tf-vpc-341038"
  source_ranges = ["0.0.0.0/0"]
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }
}

