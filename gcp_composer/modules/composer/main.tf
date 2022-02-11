data "google_project" "current_project" {
}

resource "google_project_service" "composer_api" {
  service = "composer.googleapis.com"
}

resource "google_composer_environment" "composer" {
  provider = google-beta
  name     = format("composer-env-%s%s", data.google_project.current_project.project_id, var.name_suffix)
  region   = "europe-west1" # Needs to be defined explicitly not to force replacement

  config {
    node_count = 3

    node_config {
      zone         = "europe-west1-d"
      machine_type = var.machine_type

      network    = google_compute_network.composer_network.id
      subnetwork = google_compute_subnetwork.composer_subnetwork.id

      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform",
        "https://www.googleapis.com/auth/drive"
      ]

      service_account = var.composer_worker_service_account_name
    }

    software_config {
      image_version            = var.airflow_image_version
      python_version           = 3
      pypi_packages            = var.pypi_packages
      airflow_config_overrides = var.airflow_config_overrides
    }

    # Weekends, daytime, after the morning loads have run
    maintenance_window {
      start_time = "2021-01-01T08:00:00Z"
      end_time   = "2021-01-01T16:00:00Z"
      recurrence = "FREQ=WEEKLY;BYDAY=SA,SU"
    }
  }
  depends_on = [google_project_service.composer_api]
}

resource "google_compute_network" "composer_network" {
  name                    = format("composer-network%s", var.name_suffix)
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "composer_subnetwork" {
  name          = format("composer-subnetwork%s", var.name_suffix)
  ip_cidr_range = "192.168.22.0/24"
  region        = "europe-west1"
  network       = google_compute_network.composer_network.id
}

# Needed to make the automated DAG deployments from bi-gcp-services work
resource "google_storage_bucket_iam_member" "github_action_object_admin" {
  # Extract "europe-west1-composer-env-t-30b337d6-bucket" from "gs://europe-west1-composer-env-t-30b337d6-bucket/dags"
  bucket = split("/", google_composer_environment.composer.config.0.dag_gcs_prefix)[2]
  role   = "roles/storage.objectAdmin"
  member = format("serviceAccount:%s", var.application_deployment_service_account_email)
}
