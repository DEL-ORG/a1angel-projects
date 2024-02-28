variable "aws_region" {
  type        = string
  description = "your desire aws region"
  default     = "us-east-1"
}


variable "inst_count" {
  type    = number
  default = 2
}
variable "tags" {
  type = map(any)
  default = {
    "id"             = "1800"
    "owner"          = "a1Angel"
    "teams"          = "self"
    "environment"    = "dev"
    "project"        = "rds-posgres"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "sg_port" {
  type = number
}

variable "instance_class" {
  type    = string
  default = "db.r6g.large"
}

variable "publicly_accessible" {
  type    = bool
  default = false
}
variable "subnet_ids" {
  type    = list(string)
  default = [""]
}

variable "AZ" {
  type = list(any)
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
  ]
}
variable "cluster" {
  type = map(any)
  default = {
    "cluster_identifier"      = "aurora-cluster-demo"
    "engine"                  = "aurora-postgresql"
    "engine_version"          = "11.9"
    "backup_retention_period" = 5
    "preferred_backup_window" = "07:00-09:00"
  }
}