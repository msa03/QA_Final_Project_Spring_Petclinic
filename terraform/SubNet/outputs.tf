output "subnet_1" {
    value = aws_subnet.public_subnets[0].id
}

output "subnet_2" {
    value = aws_subnet.public_subnets[1].id
}

output "subnet_ids" {
    value = aws_subnet.public_subnets[*].id
}