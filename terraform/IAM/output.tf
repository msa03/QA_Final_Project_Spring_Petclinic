output "cluster_role_policy_1" {
    value = aws_iam_role_policy_attachment.QA_teamB_EKS_role-AmazonEKSServicePolicy.id
}

output "cluster_role_policy_2" {
    value = aws_iam_role_policy_attachment.QA_teamB_EKS_role-AmazonEKSClusterPolicy.id
}