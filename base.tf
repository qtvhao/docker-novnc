terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.17.0"
    }
  }
}
data "docker_image" "novnc" {
  name  = "novnc"
}
resource "docker_container" "novnc" {
  image = data.docker_image.novnc.name
  name  = "novnc"
  ports {
    internal = 8080
    external = 80
  }
}
