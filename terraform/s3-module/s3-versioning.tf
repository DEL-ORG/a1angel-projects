resource "aws_s3_bucket_versioning" "bucker_version" {
  bucket = aws_s3_bucket.backend-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}