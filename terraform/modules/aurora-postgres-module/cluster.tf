resource "aws_rds_cluster" "a1angel_postgresql_cluster" {
  cluster_identifier              = var.cluster["cluster_identifier"]
  engine                          = var.cluster["engine"]
  engine_version                  = var.cluster["engine_version"]
  availability_zones              = var.AZ
  database_name                   = var.cluster["database_name"]
  master_username                 = var.cluster["master_username"]
  manage_master_user_password     = var.cluster["manage_master_user_password"]
  master_user_secret_kms_key_id   = aws_kms_key.a1angel_key.id
  backup_retention_period         = var.cluster["backup_retention_period"]
  preferred_backup_window         = var.cluster["preferred_backup_window"]
  deletion_protection             = var.cluster["deletion_protection"]
  apply_immediately               = var.cluster["apply_immediately"]
  storage_encrypted               = var.cluster["storage_encrypted"]
  vpc_security_group_ids          = [aws_security_group.a1angel_rds_sg.id]
  db_subnet_group_name            = aws_db_subnet_group.a1angel_subnet_gp.name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.a1angel_param_gp.name
  skip_final_snapshot = var.cluster["skip_final_snapshot"]


  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }

  tags = merge(var.tags, {
    Name = format("$s-rds-cluster", var.tags["owner"])
  })
}

