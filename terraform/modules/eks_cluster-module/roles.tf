resource "aws_iam_role" "a1angel_cluster-role" {
  name               = format("%s-eks-cluster-role", var.tags["id"])
  assume_role_policy = <<POLICY
  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
  POLICY
}