resource "random_string" "bucket_add" {
  length  = var.random["length"]
  special = var.random["special"]
  upper   = var.random["upper"]
  numeric = var.random["numeric"]
}
