variable "aws_region" {
  type        = string
  description = "your desire aws region"
  default     = "us-east-1"
}
variable "tags" {
  type = map(any)
  default = {
    "id"             = "1300"
    "owner"          = "a1angel"
    "teams"          = "devops"
    "environment"    = "dev"
    "project"        = "eks cluster"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

variable "subnet-ids" {
  type    = list(string)
  default = [""]

}

variable "private-access" {
  type = bool
}

variable "public-access" {
  type = bool
}

variable "eks_version" {
  type = number
}
