terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
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
    "owner"          = "a1angel"
    "teams"          = "angel"
    "environment"    = "dev"
    "project"        = "eks cluster"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
  
  subnet-ids = [
    "subnet-02b56024f2820201d",
    "subnet-065d6caf14b23132b",
    "subnet-0907aee243b9ac557" 
  ]
  
  private-access = false
  public-access  = true
  eks_version    = 1.27    
}

module "eks_cluster" {
  //source = "../../modules/eks_cluster-module"
  source = "git@github.com:DEL-ORG/a1angel-projects.git//terraform/modules/eks_cluster-module?ref=main"
  aws_region = local.aws_region
  tags = local.tags
  subnet-ids = local.subnet-ids
  private-access = local.private-access
  public-access = local.public-access 
  eks_version   = local.eks_version    

}