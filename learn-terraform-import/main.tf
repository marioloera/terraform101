# Configure docker provider
#
# https://www.terraform.io/docs/providers/docker/index.html
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.11"
    }
  }
  required_version = ">= 0.14"
}

provider "docker" {}
# │ Error: Error initializing Docker client: protocol not available
# │
# │   with provider["registry.terraform.io/kreuzwerker/docker"],
# │   on /Users/mario.loera/c/terraform101/learn-terraform-import/main.tf line 14, in provider "docker":
# │   14: provider "docker" {
# provider "docker" {
#   host = "npipe:////.//pipe//docker_engine"
# }
