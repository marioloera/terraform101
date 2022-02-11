output "cloud_composer_webserver_service_account" {
  # Extract "u5c86bcae4d9546d3p-tp" from "https://u5c86bcae4d9546d3p-tp.appspot.com"
  value = format("%s@appspot.gserviceaccount.com",
    split(".", substr(google_composer_environment.composer.config.0.airflow_uri,
      8,
  length(google_composer_environment.composer.config.0.airflow_uri)))[0])
}
