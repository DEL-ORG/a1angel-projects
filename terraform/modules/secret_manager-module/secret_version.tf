resource "aws_secretsmanager_secret_version" "a1angel_sercret-version" {
  secret_id     = aws_secretsmanager_secret.a1angel_secret-manager.id
  secret_string = "2024-a1angel-secret"
}
#### use this block for key value pair data #####
//resource "aws_secretsmanager_secret_version" "a1angel_secret-version2" {
//  secret_id     = aws_secretsmanager_secret.a1angel_secret-manager.id
//  secret_string = jsonencode(var.keys)
//}