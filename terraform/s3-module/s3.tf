resource "aws_s3_bucket" "backend-bucket" {
  bucket = format("%s-(random_string.bucket_add)-tf-state", var.tags["owner"])

  tags = var.tags
}