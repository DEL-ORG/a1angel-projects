terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }

}
provider "aws" {
  alias  = "s3_main"
  region = local.aws_region_main
}
provider "aws" {
  alias  = "s3_replica"
  region = local.aws_region_replica
}
provider "random" {

}


locals {
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
}

module "s3_replication" {
  source = "git@github.com:DEL-ORG/a1angel-projects.git//terraform/modules/s3_replication-module?ref=main"
  //source = "../../modules/s3_replication-module/" # call module locally
  aws_region_main    = local.aws_region_main
  aws_region_replica = local.aws_region_replica
  random_s3          = local.random_s3
  tags               = local.tags
  s3_versioning      = local.s3_versioning
}