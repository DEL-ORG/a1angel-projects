resource "aws_secretsmanager_secret_policy" "a1angel_secret-policy" {
  secret_arn = aws_secretsmanager_secret.a1angel_secret-manager.arn
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "EnableAnotherAWSAccountToReadTheSecret",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "*"
        },
        "Action" : "secretsmanager:GetSecretValue",
        "Resource" : "*"
      }
    ]
  })
}

