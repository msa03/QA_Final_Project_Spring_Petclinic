resource "aws_eks_cluster" "QA_teamB_cluster" {
  name     = "QA_teamB_cluster"
  role_arn = var.QA_teamB_cluster_role_arn

  vpc_config {
    subnet_ids = var.available_subnets
  }

  depends_on = [
    aws_iam_role_policy_attachment.QA_teamB_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.QA_teamB_AmazonEKSVPCResourceController
  ]
}

resource "aws_iam_role" "QA_teamB_cluster_role" {
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

resource "aws_iam_role_policy_attachment" "QA_teamB_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.QA_teamB_cluster_role.name
}

resource "aws_iam_role_policy_attachment" "QA_teamB_AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.QA_teamB_cluster_role.name
}

resource "aws_eks_node_group" "QA_teamB_node_group" {
  cluster_name    = aws_eks_cluster.QA_teamB_cluster.name
  node_group_name = "QA_teamB_node_group"
  node_role_arn   = var.QA_teamB_node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  

  update_config {
    max_unavailable = 2
  }

  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
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

resource "aws_iam_role_policy_attachment" "example-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.QA_teamB_node_role.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.QA_teamB_node_role.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.QA_teamB_node_role.name
}