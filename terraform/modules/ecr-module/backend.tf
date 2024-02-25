terraform {
  backend "a1angel_backend" {
    bucket         = var.backend["bucket"]
    dynamodb_table = var.backend["dynamodb_table"]
    key            = var.backend["key"]
    region         = var.backend["region"]
  }
}