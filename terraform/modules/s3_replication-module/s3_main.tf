resource "aws_s3_bucket" "s3_main" {
  provider = aws.s3_main
  bucket   = format("%s-${random_string.s3_main-random.result}-main", var.tags["id"])
  tags = var.tags
}

resource "aws_s3_bucket_versioning" "main_s3_versioning" {
  provider = aws.s3_main
  bucket   = aws_s3_bucket.s3_main.id
  versioning_configuration {
    status = var.s3_versioning
  }
}


