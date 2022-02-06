terraform {
  required_version = "1.1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.84.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.84.0"
    }
  }
}


provider "google" {
  project = "trustly-data-services-prod"
  region  = "europe-west1"
}

provider "google-beta" {
  project = "trustly-data-services-prod"
  region  = "europe-west1"
}
