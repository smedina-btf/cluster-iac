terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.52.0"
    }
  }

  backend "gcs" {
    bucket = "cluster-iac-tfsate"
    prefix = "dev"
  }

  required_version = ">= 1.2.0"
}

provider "google" {
  project = "cluster-iac-dev"
  region  = var.region
}
