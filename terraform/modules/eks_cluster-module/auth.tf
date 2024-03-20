data "tls_certificate" "cluster_connect-url" {
  url = aws_eks_cluster.a1angel-cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "oidc_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.cluster_connect-url.certificates[0].sha1_fingerprint]
  url             = data.tls_certificate.cluster_connect-url.url
}

