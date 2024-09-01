variable "ami_id" {
    type = string
}
variable "instance_type" {
    type = string
}
variable "key_name" {
    type = string
}
variable "sg_name" {
    type = string
}
variable "subnet_az" {
    type = string
}
variable "vpc_cidr" {
    type = string
}
variable "ports_list" {
    type = list(number)
}


