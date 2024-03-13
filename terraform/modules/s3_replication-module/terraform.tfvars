aws_region_main    = "us-east-1"
aws_region_replica = "us-east-2"

random_s3 = {
  special = false
  upper   = false
  numeric = true
}
tags = {
  "id"             = "1300"
  "owner"          = "a1Angel"
  "teams"          = "PD"
  "environment"    = "dev"
  "project"        = "S3 replication"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}

s3_versioning = "Enabled"