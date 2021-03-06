module "composer_airflow_two" {
  source = "../modules/composer2"

  name_suffix                                  = "-two"
  composer_worker_service_account_name         = google_service_account.svc_composer_worker.name
  application_deployment_service_account_email = google_service_account.svc_github_action_application_deployment.email
  airflow_image_version                        = "composer-2.0.3-airflow-2.2.3"

  pypi_packages = {
    "bigquery-schema-generator" = "==1.5"
    "jira"                      = "==2.0.0"
    "simple-salesforce"         = "==1.10.1"
    "slack-sdk"                 = "==3.4.2"
  }

  airflow_config_overrides = {
    "webserver-navbar_color" = "#00ff3c" # ~ Trustly green
  }
}
