resource "aws_iam_role" "a1angel_lambda" {
  name = format("%s-lambda", var.tags["owner"])
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"

      }
    ]
  })
}

resource "aws_lambda_permission" "a1angel_lambda_perm" {
  statement_id  = "AllowSecretsManagerToInvokeLambda"
  action        = "lambda:InvokeFunction"
  function_name = "lambda_function_name"
  principal     = "secretsmanager.amazonaws.com"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda.js"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "a1angel_lambda-function" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.a1angel_lambda.arn
  handler       = "index.test"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "nodejs18.x"

  environment {
    variables = {
      env = "dev"
    }
  }
}