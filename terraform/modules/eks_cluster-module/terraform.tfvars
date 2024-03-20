aws_region = "us-east-1"

tags = {
  "id"             = "1300"
  "owner"          = "a1angel"
  "teams"          = "angel"
  "environment"    = "dev"
  "project"        = "eks cluster"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}

subnet-ids = [
  "subnet-02b56024f2820201d",
  "subnet-065d6caf14b23132b",
  "subnet-0907aee243b9ac557"

]

private-access = false
public-access  = true
eks_version    = 1.27


