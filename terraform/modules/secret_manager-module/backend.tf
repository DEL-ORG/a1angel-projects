terraform {
  backend "s3" {
    bucket = "terraform-angel"
    //dynamodb_table = "${aws_dynamodb_table.main_dynamodb.name}"
    key    = "DevOps/secret-manager/terraform.tfstate"
    region = "us-east-1"
  }
}