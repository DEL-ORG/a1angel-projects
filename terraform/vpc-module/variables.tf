variable "region" {
  type    = string
  default = "us-east-1"
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "1800"
    "owner"          = "a1Angel"
    "teams"          = "DevOps"
    "environment"    = "dev"
    "project"        = "vpc"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }

}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "availability_zone" {
  type = list(any)
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
  ]
}