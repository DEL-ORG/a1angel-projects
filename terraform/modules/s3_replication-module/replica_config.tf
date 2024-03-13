resource "aws_s3_bucket_replication_configuration" "replication" {
  provider   = aws.s3_main
  depends_on = [aws_s3_bucket_versioning.main_s3_versioning]

  role   = aws_iam_role.s3_main_bucket_role.arn
  bucket = aws_s3_bucket.s3_main.id

  rule {
    id     = "a1Angel"
    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.s3_replica.arn
      storage_class = "STANDARD"
    }
  }
}