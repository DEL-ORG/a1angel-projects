resource "aws_iam_role_policy_attachment" "a1angel_cluster-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.a1angel_cluster-role.name
}

resource "aws_iam_role_policy_attachment" "a1angel_resource-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.a1angel_cluster-role.name
}