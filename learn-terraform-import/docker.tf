resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "web" {
  name  = "hashicorp-learn"
  image = docker_image.nginx.latest

  ports {
    external = 8080
    internal = 80
  }
}
