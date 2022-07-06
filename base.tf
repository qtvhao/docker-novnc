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
  env = [
    "RUN_FLUXBOX=no",
    "RUN_XTERM=no",
  ]
  ports {
    internal = 8080
    external = 80
  }
}

#data "docker_image" "cypress" {
#  name  = "cypress/included"
#}
resource "docker_container" "cypress" {
  image = "cypress/included:3.4.0" //data.docker_image.cypress.name
  name  = "cypress"
  env = [
    "DISPLAY=${docker_container.novnc.ip_address}:0.0"
  ]
  entrypoint = ["cypress"]
  command = ["open"]
}
