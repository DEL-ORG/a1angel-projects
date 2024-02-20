resource "aws_dynamodb_table" "tf_state_lock" {
  name           = format("%s-(random_string.bucket_add)-tf-state-lock", var.tags["owner"])
  hash_key       = "myAttribute"
  read_capacity  = 10
  write_capacity = 10

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = var.tags
}
