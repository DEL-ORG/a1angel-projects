resource "aws_dynamodb_table" "main_dynamodb" {
  provider       = aws.s3_main
  name           = format("dynamodb-${random_string.s3_main-random.result}-%s", var.tags["id"])
  hash_key       = "BEWARE"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "BEWARE"
    type = "S"
  }
}

