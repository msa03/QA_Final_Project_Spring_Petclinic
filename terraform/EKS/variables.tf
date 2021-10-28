 variable "QA_teamB_EKS_role_arn" {
    description = "IAM Role for EKS Cluster"
}

variable "QA_teamB_node_role_arn" {
    description = "IAM Role for EKS Node Group"
}

variable "available_subnets" {
    type = list(string)
    description = "Available subnets"
}

variable "subnet_ids" {
    description = "Subnet Ids"
}