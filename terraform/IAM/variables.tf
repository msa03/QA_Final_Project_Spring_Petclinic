variable "eks_cluster_policy" {
    default = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

variable "eks_service_policy" {
    default = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}