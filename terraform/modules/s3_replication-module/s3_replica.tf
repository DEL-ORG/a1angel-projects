resource "aws_s3_bucket" "s3_replica" {
  bucket   = format("%s-${random_string.s3_replica-random.result}-replica", var.tags["id"])
  provider = aws.s3_replica
  tags     = var.tags
}

resource "aws_s3_bucket_versioning" "s3_replica-versioning" {
  provider = aws.s3_replica
  bucket   = aws_s3_bucket.s3_replica.id
  versioning_configuration {
    status = var.s3_versioning
  }
}


