region = "us-east-1"

tags = {
  "id"             = "1800"
  "owner"          = "a1angel"
  "teams"          = "devops"
  "environment"    = "dev"
  "project"        = "ec2"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}

a1angel_ports = [
  22,
  80,
  8080
]

instance_type = "t2.micro"

tenancy = "default"

pub_ip = true

api_termination = true

volume_size = 8

vpc_id = "vpc-04081456ed925b05c"

ami_type = "a1ngel_ubuntu"

backend = {
    bucket         = ""
    dynamodb_table = ""
    key            = ""
    region         = ""
}

