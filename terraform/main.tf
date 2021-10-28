provider "aws" {
    region      = "eu-west-1"
    shared_credentials_file = "~/Users/James/.aws/credentials"  
}

module "vpc" {
    source = "./VPC"
    vpc_cidr_block = "172.160.0.0/16"
    
}

module "subnet" {
    source = "./SubNet"
    vpc_id = module.vpc.vpc_id
    vpc_cidr_block = module.vpc.vpc_cidr_block
    
}

module "security_group" {
    source = "./SecGr"
    vpc_id = module.vpc.vpc_id
    
}

module "igw" {
    source = "./IGW"
    vpc_id = module.vpc.vpc_id
    subnet_1 = module.subnet.subnet_1
    subnet_2 = module.subnet.subnet_2
}

module "iam" {
    source = "./IAM"
#    QA_teamB_EKS_role_attachment = module.iam.cluster_role_policy_2
}

module "eks" {
    source = "./EKS"
    subnet_ids = module.subnet.subnet_ids
    QA_teamB_EKS_role_arn = module.iam.cluster_iam_role
    QA_teamB_node_role_arn = module.iam.node_iam_role
    available_subnets = [module.subnet.subnet_1, module.subnet.subnet_2]
}

module "manager_node" {
    source = "./EC2"
    subnet_id = module.subnet.subnet_1
    vpc_security_group_ids = [module.security_group.sg_id]
    ami_id = var.ami_id
}