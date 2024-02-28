aws_region = "us-east-1"

vpc_id     = "vpc-04081456ed925b05c"
subnet_ids = ["subnet-02b56024f2820201d", "subnet-0347ec60a9442c2ea"]
AZ         = ["us-east-1a", "us-east-1b"]

tags = {
  "id"             = "1800"
  "owner"          = "a1Angel"
  "teams"          = "self"
  "environment"    = "dev"
  "project"        = "rds-posgres"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}

cluster = {
  "cluster_identifier"      = "aurora-cluster-demo"
  "engine"                  = "aurora-postgresql"
  "engine_version"          = "11.9"
  "backup_retention_period" = 5
  "preferred_backup_window" = "07:00-09:00"
}

inst_count          = 2
publicly_accessible = false

sg_port = 5432

instance_class = "db.r6g.large"

