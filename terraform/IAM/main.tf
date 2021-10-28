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

resource "aws_iam_role" "QA_teamB_node_role" {
  name = "QA_teamB_node_role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "QA_teamB_node_role-AmazonEKSWorkerNodePolicy" {
  policy_arn = var.eks_worker_node_policy
  role       = aws_iam_role.QA_teamB_node_role.name
}

resource "aws_iam_role_policy_attachment" "QA_teamB_node_role-AmazonEKS_CNI_Policy" {
  policy_arn = var.eks_cni_policy
  role       = aws_iam_role.QA_teamB_node_role.name
}

resource "aws_iam_role_policy_attachment" "QA_teamB_node_role-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = var.ec2_container_registry_readonly_policy
  role       = aws_iam_role.QA_teamB_node_role.name
}