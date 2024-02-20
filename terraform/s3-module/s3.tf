resource "aws_s3_bucket" "a1angel_s3_backend" {
  bucket = format("%s-${random_string.a1angel_random_str_s3.result}-statefile", var.tags["id"])

  tags = merge(var.tags, {
    Name = a1angel_s3_backend
  })
}