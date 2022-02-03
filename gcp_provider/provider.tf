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
