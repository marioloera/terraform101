terraform {
  required_version = "1.1.5"
}


provider "google" {
  project = "trustly-data-services-prod"
  region  = "europe-west1"
  version = "~> 3.84.0"
}

provider "google-beta" {
  project = "trustly-data-services-prod"
  region  = "europe-west1"
  version = "~> 3.84.0"
}
