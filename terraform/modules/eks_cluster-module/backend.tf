terraform {
  backend "s3" {
    bucket = "terraform-angel"
    key    = "DevOps/eks-cluster/terraform.tfstate"
    region = "us-east-1"
  }
}