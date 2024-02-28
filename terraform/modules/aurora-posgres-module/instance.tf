resource "aws_rds_cluster_instance" "a1angel_instance" {
  count                = var.inst_count
  identifier           = "a1angel-rds-instance-${count.index + 1}"
  cluster_identifier   = aws_rds_cluster.a1angel_postgresql_cluster.cluster_identifier
  engine               = aws_rds_cluster.a1angel_postgresql_cluster.engine
  instance_class       = var.instance_class
  engine_version       = aws_rds_cluster.a1angel_postgresql_cluster.engine_version
  db_subnet_group_name = aws_db_subnet_group.a1angel_subnet_gp.name
  publicly_accessible  = var.publicly_accessible

  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }
  tags = merge(var.tags, {
    Name = "cluster-instance-${count.index + 1}"
  })
}