resource "aws_eks_cluster" "QA_teamB_cluster" {
  name     = "QA_teamB_cluster"
  role_arn = var.QA_teamB_EKS_role_arn

  vpc_config {
    subnet_ids = var.available_subnets
  }

  # depends_on = [
  #   aws_iam_role_policy_attachment.QA_teamB_EKS_role-AmazonEKSClusterPolicy,
  #   aws_iam_role_policy_attachment.QA_teamB_EKS_role-AmazonEKSVPCResourceController
  # ]
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
    max_unavailable = 1 
  }

  # depends_on = [
  #   aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
  #   aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
  #   aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  # ]
}