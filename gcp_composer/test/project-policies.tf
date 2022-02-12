# https://cloud.google.com/composer/docs/composer-2/create-environments
# (Once per project) Grant required permissions to Cloud Composer service account

resource "google_project_iam_binding" "composer_service_aggent2ext" {
  project = var.project
  role = "roles/composer.ServiceAgentV2Ext"
  members = [
    "serviceAccount:service-496466744113@cloudcomposer-accounts.iam.gserviceaccount.com",
    # prod "serviceAccount:service-94051165432@cloudcomposer-accounts.iam.gserviceaccount.com", 
  ]
}
