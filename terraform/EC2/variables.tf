variable "instance" {
    description = "This variable states the type of instance used for the EC2"
    default = "t2.medium"
}

variable "ami_id" {
    description = "this variable states the type of AMI used by the new EC2 instances"

}

variable "subnet_id" {
    description = "subnet ID for the EC2"

}

variable "name" {
    description = "Name of the EC2 instances"
    default = "QA_teamB_manager_node"
}

variable "enable_public_ip" {
    description = "Enable if EC2 instance should have public IP address"
    default = true
  
}

variable "vpc_security_group_ids" {
    description = "VPC Security group IDs"
}

#variable "user_data" {
#    description = "script to run when creating the instance"
#    default = file("${path.module}/scripts/init.sh")
#    default = "data.template_file.init.rendered"
  
#}