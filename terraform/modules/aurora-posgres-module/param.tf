resource "aws_rds_cluster_parameter_group" "a1angel_param_gp" {
  name        = "a1angel-rds-cluster-pg"
  family      = "aurora-postgresql11"
  description = "RDS default cluster parameter group"

  #parameter {
  #  name         = "character_set_server"
  #  value        = "utf8"
  #  apply_method = "pending-reboot"
  #}
}