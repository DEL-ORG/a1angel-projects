resource "aws_iam_role" "s3_main_bucket_role" {
  provider           = aws.s3_main
  name               = "s3_bucket_role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
  tags               = var.tags
}


resource "aws_iam_policy" "replica_policy" {
  provider = aws.s3_main
  name     = "replica_policy"
  policy   = data.aws_iam_policy_document.replica_policy.json
}

resource "aws_iam_role_policy_attachment" "replica_policy_attach" {
  provider   = aws.s3_main
  role       = aws_iam_role.s3_main_bucket_role.name
  policy_arn = aws_iam_policy.replica_policy.arn
}

data "aws_iam_policy_document" "replica_policy" {
  provider = aws.s3_main
  statement {
    effect = "Allow"

    actions = [
      "s3:GetReplicationConfiguration",
      "s3:ListBucket",
    ]

    resources = [aws_s3_bucket.s3_main.arn]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:GetObjectVersionForReplication",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionTagging",
    ]

    resources = ["${aws_s3_bucket.s3_main.arn}/*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:ReplicateObject",
      //"s3:ReplicateDelete",  # If you don't want to replicate delete from the main bucket
      "s3:ReplicateTags",
    ]

    resources = ["${aws_s3_bucket.s3_replica.arn}/*"]
  }
}

