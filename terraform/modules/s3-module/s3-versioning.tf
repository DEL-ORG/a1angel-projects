resource "aws_s3_bucket_versioning" "a1angel_s3_versioning" {
  bucket = aws_s3_bucket.a1angel_s3_backend.id
  versioning_configuration {
    status = var.s3_versioning
  }
}