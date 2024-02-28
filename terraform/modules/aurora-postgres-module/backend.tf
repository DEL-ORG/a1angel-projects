terraform {
  backend "s3" {
    bucket = "terraform-angel"
    #dynamodb_table = var.backend["dynamodb_table"]
    key    = "DevOps/rds-state"
    region = "us-east-1"
  }
}