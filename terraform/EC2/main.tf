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
  key_name   = jenkpub
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCCj+HEDPU3h9L40Yf0JHu+De2Uo+nXiv21IUUbOX1A6L9cgIRR7oCBXloaorXBomx6YZKbKQIXSRHz+ZDDsAGk8GJW0WOjmnJUsrkEsvXW6UU1QsdpaTrJv+gbuX8zCgL6GQheUK2TWRU1ZcUuk6JHpGSKFottZz4wwtRjmB17mSOpYCq6u1uZlEwKE7DHQBgFV1L3HWFs7ITtV1yPQoqO4P3v1ccIs6HGWVvZhc+/7yKDdRFV933XNWi0fv7sEFvurf9tuodEOtKoB3Bj0nMAV7hwEqwDyP24SERrDxEC+DsmWfMWVxycRSvjhMUmlGwCAgBgQ64ppKZgbNn4SD+5 rsa-key-20211028"
}
#data "template_file" "init" {
#    template = "${file("${path.module}/scripts/init.sh")}"
#}