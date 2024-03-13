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
  region = var.aws_region_main
}
provider "aws" {
  alias  = "s3_replica"
  region = var.aws_region_replica
}
provider "random" {

}