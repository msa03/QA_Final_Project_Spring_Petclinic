resource "aws_instance" "qa_manager_node" {
    ami                 = var.ami.id
    instance_type       =var.instance

    assosciate_public_ip_address = var.enable_public_ip
    subnet_id           = var.subnet_id
    vpc_security_group_ids  = var.vpc_security_group_ids
    user_data           = var.user_data
    tags = {
        Name = var.name
    }
}

data "template_file" "init" {
    template = "${file("${path.module}/scripts/init.sh")}"
}