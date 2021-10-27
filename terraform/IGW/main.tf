resource "aws_internet_gateway" "QA_teamB_igw" {   
    vpc_id = var.vpc_id
    tags = {
        Name = "IGW"
    }
}
resource "aws_route_table" "rt" {
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.QA_teamB_igw.id
    }
    tags = {
        Name = "Route Table for VPC"
    }
}
resource "aws_route_table_association" "public_subnet_rta" {
    subnet_id = var.subnet_1
    route_table_id = aws_route_table.rt.id
}
resource "aws_route_table_association" "public_subnet_rtb" {
    subnet_id = var.subnet_2
    route_table_id = aws_route_table.rt.id
}