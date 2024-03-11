locals {
  region = "us-east-1"

  tags = {
    "id"             = "1800"
    "owner"          = "a1angel"
    "teams"          = "devops"
    "environment"    = "dev"
    "project"        = "ecr"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
 }
  scan_config = {
  "scan_type"      = "BASIC"
  "scan_frequency" = "SCAN_ON_PUSH"
  "filter"         = "*"
}
  mutability = "MUTABLE"

  scan_on_push = true

  ecr_repo_name = [
  "ui",
  "carts",
  "catalog",
  "orders",
  "checkout"
]

  
  backend = {
      bucket         = ""
      dynamodb_table = ""
      key            = ""
      region         = ""
  }
}

module "ec2" {
    //source = "../../modules/ecr-module"
    source = "git@github.com:DEL-ORG/a1angel-projects.git//terraform/modules/ecr-module?ref=main"
    region = local.region
    tags = local.tags
    backend = local.backend
    ecr_repo_name = local.ecr_repo_name
    mutability = local.mutability
    scan_on_push = local.scan_on_push  
}