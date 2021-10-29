variable "sg_web_name" {
    default = "QAFinalProjectSG"
}
variable "sg_web_description" {
    default = "Allow SSH"
}
variable "ip_addresses" {
    default = "0.0.0.0/0"
}
variable "ingress_ports" {
    type        = list(number)
    description = "All ingress ports"
    default     = [22, 8080, 80]
}
variable "outbound_port" {
    description = "Port open for outbound connections"
    default     = 0
}
variable "vpc_id" {
    description = "ID for VPC"
}
