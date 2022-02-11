/*
  Service accounts are just defined here. Permissions are granted in project-policies.tf or
  when defining datasets and buckets.
*/

resource "google_service_account" "svc_composer_worker" {
  account_id = "svc-composer-worker"
}

resource "google_service_account" "svc_github_action_application_deployment" {
  # As opposed to the Terraform service account handling infrastructure
  account_id = "svc-application-deployment"
}
