resource "docker_container" "web" {
  name  = "hashicorp-learn"
  image = "sha256:605c77e624ddb75e6110f997c58876baa13f8754486b461117934b24a9dc3a85"

  ports {
    external = 8080
    internal = 80
  }
}
