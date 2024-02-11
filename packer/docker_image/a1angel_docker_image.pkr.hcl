packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:20.04"
  commit = true
}

build {
  name = "ubuntu-20.04-a1angel"
  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "shell" {
    script       = "script.sh"
    pause_before = "10s"
  }
  provisioner "file" {
    source      = "users.txt"
    destination = "/tmp/users.txt"
  }
  post-processors {
    post-processor "docker-tag" {
      repository = "devopseasylearning/a1angel-ubuntu-master-image"
      tags       = ["v1.0.0"]
    }
    post-processor "docker-push" {
      login          = "true"
      login_username = "devopseasylearning"
      login_password = "dckr_pat_e_n214_A6_fX1p8q9nNFmsIQkvA"
    }
  }
}




