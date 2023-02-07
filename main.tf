
terraform {
    required_providers {
        google  = {
            source  = "hashicorp/google"
            version = "3.52.0"
        }
    } 

    backend "gcs" {
        bucket  = "terraform_bucket_pvs"
        prefix  = "terraform/terraform.tfstate"
        credentials  = "serviceaccount.json"
    }
}

provider "google" {
  project = var.project_id
  region  = var.region
  credentials  = "${file("pvs-devops-iac-377117-f7217ef6e808.json")}"
}