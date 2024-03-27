resource "aws_secretsmanager_secret_rotation" "a1angel_secret-rotate" {
  secret_id           = aws_secretsmanager_secret.a1angel_secret-manager.id
  rotation_lambda_arn = aws_lambda_function.a1angel_lambda-function.arn

  rotation_rules {
    automatically_after_days = var.rotation-window
  }
}