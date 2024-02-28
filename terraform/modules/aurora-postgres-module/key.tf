resource "aws_kms_key" "a1angel_key" {
  description = "a1angel rds cluster KMS Key"
  deletion_window_in_days = var.deletion_window
}