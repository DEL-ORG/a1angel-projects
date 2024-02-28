locals {
  aws_region = "us-east-1"

  tags = {
    "id"             = "1800"
    "owner"          = "a1Angel"
    "teams"          = "self"
    "environment"    = "dev"
    "project"        = "rds-posgres"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }

  vpc_id     = "vpc-04081456ed925b05c"
  subnet_ids = ["subnet-02b56024f2820201d", "subnet-0347ec60a9442c2ea"]
  AZ         = ["us-east-1a", "us-east-1b"]
  inst_count          = 2
  publicly_accessible = false
  sg_port = 5432
  instance_class = "db.r6g.large"
  deletion_window = 10

  cluster = {
    "cluster_identifier"      = "aurora-cluster-demo"
    "engine"                  = "aurora-postgresql"
    "engine_version"          = "11.9"
    "backup_retention_period" = 5
    "preferred_backup_window" = "07:00-09:00"
    "database_name "                  = "a1angel_tb"
    "master_username"                 = "a1angel"
    "manage_master_user_password"     = true
    "deletion_protection"             = false
    "apply_immediately"               = true
    "storage_encrypted "              = true
    "skip_final_snapshot" = true
  }

}

module "auro-postgres" {
    source = "../../modules/aurora-postgres-module"
    aws_region = local.aws_region
    tags = local.tags
    vpc_id = local.vpc_id
    AZ = local.AZ
    subnet_ids = local.subnet_ids
    inst_count = local.inst_count
    sg_port = local.sg_port
    publicly_accessible = local.publicly_accessible
    instance_class = local.instance_class
    cluster = local.cluster
    deletion_window = local.deletion_window
}