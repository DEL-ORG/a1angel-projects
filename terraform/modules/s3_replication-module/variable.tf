variable "aws_region_main" {
  type    = string
  default = "us-east-1"
}

variable "aws_region_replica" {
  type    = string
  default = "us-east-2"
}

variable "random_s3" {
  type = map(bool)
  default = {
    "special" = false
    "upper  " = false
    "numeric" = false
  }
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "1300"
    "owner"          = "a1Angel"
    "teams"          = "PD"
    "environment"    = "dev"
    "project"        = "S3 Backend"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }

}

variable "s3_versioning" {
  type    = string
  default = "Enabled"

}