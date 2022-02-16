variable "composer_worker_service_account_name" {
  description = "The 'name' of the service account that will be used when executing DAGs"
  type        = string
}

variable "application_deployment_service_account_email" {
  description = "The 'email' of the service account used to deploy code (DAGs) to Airflow"
  type        = string
}

variable "machine_type" {
  description = "Type of Google Cloud Compute instances to use for the GKE cluster"
  type        = string
  default     = "n1-standard-2"
}

variable "airflow_image_version" {
  description = "Determines the Cloud Composer/Airflow image version to be installed"
  type        = string
  default     = "composer-1.11.1-airflow-1.10.9"
}

variable "pypi_packages" {
  description = "Overrides the properties in Cloud Composer's internal airflow.cfg file"
  type        = map(any)
  default     = {}
}

variable "airflow_config_overrides" {
  description = "Overrides the properties in Cloud Composer's internal airflow.cfg file"
  type        = map(any)
  default     = {}
}
variable "name_suffix" {
  description = "name suffix for composer, network and subnetwork"
  type        = string
  default     = ""
}
