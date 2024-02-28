resource "aws_db_subnet_group" "a1angel_subnet_gp" {
  name       = "a1angel_subnet_group"
  subnet_ids = var.subnet_ids
  tags = merge(var.tags, {
    Name = format("%s-rds-subnet-group", var.tags["owner"])
  })
}