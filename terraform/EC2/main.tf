resource "aws_instance" "qa_manager_node" {
    ami                 = var.ami_id
    instance_type       =var.instance

    associate_public_ip_address = var.enable_public_ip
    subnet_id           = var.subnet_id
    vpc_security_group_ids  = var.vpc_security_group_ids
    user_data           = file("${path.module}/scripts/init.sh")
    tags = {
        Name = var.name
    }
    
}
resource "aws_key_pair" "jenkinsbuildkey" {
  key_name   = "jenkinsbuildkey"
  public_key = file("${path.module}/scripts/jenkinsbuildkey.pem")
}

#data "template_file" "init" {
#    template = "${file("${path.module}/scripts/init.sh")}"
#}