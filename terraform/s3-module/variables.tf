variable "region" {
  type    = string
  default = "us-east-1"
}

variable "tags" {
  type = any
  default = {
    "id"             = "2580"
    "owner"          = "Lady Angel"
    "teams"          = "a1"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

variable "random" {
  type = any
  default = {
    length  = 10
    special = false
    upper   = false
    numeric = true
  }
}