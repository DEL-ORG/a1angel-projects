packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "a1angel-jenkins-master" {
  ami_name      = "a1angel-jenkins-master-ubuntu-20.04"
  instance_type = "t2.medium"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}
build {
  name = "a1angel-jenkins-master-ubuntu-20.04"
  sources = [
    "source.amazon-ebs.a1angel-jenkins-master"
  ]
  provisioner "shell" {
    execute_command = "echo 'packer' | sudo -S env {{ .Vars }} {{ .Path }}"
    script          = "script.sh"
    pause_before    = "10s"

  }

}