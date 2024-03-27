resource "aws_secretsmanager_secret" "a1angel_secret-manager" {
  name                    = format("%s-secret-manager", var.tags["owner"])
  recovery_window_in_days = 0
  tags = merge(var.tags, {
    Name = format("%s-secret-manager", var.tags["id"])
  })
}
