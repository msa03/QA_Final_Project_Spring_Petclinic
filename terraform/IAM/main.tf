resource "aws_iam_role" "QA_teamB_EKS_role" {
  name = "QA_teamB_EKS_role"

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

resource "aws_iam_role_policy_attachment" "QA_teamB_EKS_role-AmazonEKSClusterPolicy" {
  policy_arn = var.eks_cluster_policy
  role       = aws_iam_role.QA_teamB_EKS_role.name
}

resource "aws_iam_role_policy_attachment" "QA_teamB_EKS_role-AmazonEKSServicePolicy" {
  policy_arn = var.eks_service_policy
  role       = aws_iam_role.QA_teamB_EKS_role.name
}

