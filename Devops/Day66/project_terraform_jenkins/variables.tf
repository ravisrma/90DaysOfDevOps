variable "region" {
    type = string
}
variable "vpc_cidr" {
    type = string
}
variable "vpc_name" {
    type = string
}
variable "subnet1_az" {
    type = string
}
variable "subnet2_az" {
    type = string
}
variable "pub_subnet1_cidr" {
    type = string
}
variable "pub_subnet2_cidr" {
    type = string
}
variable "igw_name" {
    type = string
}
variable "rt_name" {
    type = string
}
variable "sg_name" {
    type = string
}
variable "key_name" {
    type = string
}
variable "lb_name" {
    type = string
}
variable "asg_name" {
    type = string
}
variable "tg_name" {
    type = string
}
variable "ami_id" {
    type = string
}
variable "instance_type" {
    type = string
}
variable "launch_template_name" {
    type = string
}
variable "device_name" {
    type = string
}
variable "volume_size" {
    type = number
}
variable "volume_type" {
    type = string
}
variable "delete_on_termination" {
    type = bool
}
variable "resource_type" {
    type = string
}
variable "max_size" {
    type = number
}
variable "min_size" {
    type = number
}
variable "desired_capacity" {
    type = number
}
