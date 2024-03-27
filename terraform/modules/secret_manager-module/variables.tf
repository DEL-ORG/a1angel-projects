variable "aws_region" {
  type        = string
  description = "your desire aws region"
  default     = "us-east-1"
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "1300"
    "owner"          = "a1Angel"
    "teams"          = "PD"
    "environment"    = "dev"
    "project"        = "secret manager"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

variable "keys" {
  type = map(string)
  default = {
    "key1" = "value1"
    "key2" = "value2"
  }
}

variable "rotation-window" {
   type = number  
}


