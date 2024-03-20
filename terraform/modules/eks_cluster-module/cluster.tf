resource "aws_eks_cluster" "a1angel-cluster" {
  name     = format("%s-eks-cluster", var.tags["owner"])
  role_arn = aws_iam_role.a1angel_cluster-role.arn
  version  = var.eks_version

  vpc_config {
    endpoint_private_access = var.private-access
    endpoint_public_access  = var.public-access
    subnet_ids              = var.subnet-ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.a1angel_cluster-policy,
    aws_iam_role_policy_attachment.a1angel_resource-policy,
  ]
}