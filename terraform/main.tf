provider "aws" {
    region      = "eu-west-1"
    shared_credentials_file = "~/.aws/credentials"
  
}

module "vpc" {
    source = "./VPC"
    vpc_cidr_block = "172.160.0.0/16"
    
}

module "subnet" {
    source = "./SUBNET"
    vpc_id = module.vpc.vpc_id
    vpc_cidr_block = module.vpc.vpc_cidr_block
    
}

module "security" {
    source = ""
    
}