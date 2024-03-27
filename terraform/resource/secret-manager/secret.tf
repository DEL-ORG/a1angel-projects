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
  region = local.aws_region
}

locals {
  aws_region = "us-east-1"
   tags = {
     "id"             = "1300"
     "owner"          = "a1Angel"
     "teams"          = "PD"
     "environment"    = "dev"
     "project"        = "secret manager"
     "create_by"      = "Terraform"
     "cloud_provider" = "aws"
   }
   keys = {
     "key1" = "value1"
     "key2" = "value2"
   }
   
   rotation-window = 30
}

module "vpc" {
  //source = "../../modules/secret_manager-module"
  source = "git@github.com:DEL-ORG/a1angel-projects.git//terraform/modules/secret_manager-module?ref=main"
  region = local.aws_region
  tags = local.tags
  keys = local.keys
  rotation-window = local.rotation-window

}