output "cluster_role_policy_1" {
    value = aws_iam_role_policy_attachment.QA_teamB_EKS_role-AmazonEKSServicePolicy.id
}

output "cluster_role_policy_2" {
    value = aws_iam_role_policy_attachment.QA_teamB_EKS_role-AmazonEKSClusterPolicy.id
}

output "node_iam_role" {
    value = aws_iam_role.QA_teamB_EKS_role_arn.arn
}

output "cluster_iam_role" {
    value = aws_iam_role.QA_teamB_EKS_role_arn.arn
}

output "node_role_policy_1" {
    value = aws_iam_role_policy_attachment.QA_teamB_EKS_role_arn-AmazonEKSWorkerNodePolicy.id
}

output "node_role_policy_2" {
    value = aws_iam_role_policy_attachment.QA_teamB_EKS_role_arn-AmazonEKS_CNI_Policy.id
}

output "node_role_policy_3" {
    value = aws_iam_role_policy_attachment.QA_teamB_EKS_role_arn-AmazonEC2ContainerRegistryReadOnly.id
}