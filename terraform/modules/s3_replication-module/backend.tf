terraform {
  backend "s3" {
    bucket = "terraform-angel"
    //dynamodb_table = "${aws_dynamodb_table.main_dynamodb.name}"
    key    = "DevOps/s3-replica/terraform.tfstate"
    region = "us-east-1"
  }
}