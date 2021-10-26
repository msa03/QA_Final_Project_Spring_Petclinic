variable "eks_cluster_policy" {
    default = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

variable "eks_service_policy" {
    default = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

variable "eks_worker_node_policy" {
    default = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

variable "eks_cni_policy" {
    default = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

variable "ec2_container_registry_readonly_policy" {
    default = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}