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
  region = local.region
}
provider "random" {

}

locals {
  region = "us-east-1"

  random_s3 = {
    special = false
    upper   = false
    numeric = true
}

s3_versioning = "Enabled"

}

module "vpc" {
  source = "../s3-module"
  region = local.region
  random_s3 = local.random_s3 
  s3_versioning = local.s3_versioning

}