resource "aws_rds_cluster" "a1angel_postgresql_cluster" {
  cluster_identifier              = var.cluster["cluster_identifier"]
  engine                          = var.cluster["engine"]
  engine_version                  = var.cluster["engine_version"]
  availability_zones              = var.AZ
  database_name                   = "a1angel_tb"
  master_username                 = "a1angel"
  manage_master_user_password     = true
  master_user_secret_kms_key_id   = aws_kms_key.a1angel_key.id
  backup_retention_period         = var.cluster["backup_retention_period"]
  preferred_backup_window         = var.cluster["preferred_backup_window"]
  deletion_protection             = false
  apply_immediately               = true
  storage_encrypted               = true
  vpc_security_group_ids          = [aws_security_group.a1angel_rds_sg.id]
  db_subnet_group_name            = aws_db_subnet_group.a1angel_subnet_gp.name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.a1angel_param_gp.name
  skip_final_snapshot = true


  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }

  tags = merge(var.tags, {
    Name = "a1angel"
  })
}

