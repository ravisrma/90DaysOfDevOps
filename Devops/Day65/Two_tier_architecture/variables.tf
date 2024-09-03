variable "region" {
    type        = string
}
variable "vpc_cidr" {
    type        = string
}
variable "vpc_name" {
    type        = string
}
variable "subnet1_az" {
    type        = string
}
variable "pub_subnet1_cidr" {
    type        = string
}
variable "subnet2_az" {
    type        = string
}
variable "pub_subnet2_cidr" {
    type        = string
}
variable "pri_subnet1_cidr" {
    type        = string
}
variable "pri_subnet2_cidr" {
    type        = string
}
variable "igw_name" {
    type        = string
}
variable "rt_name" {
    type        = string
}
variable "sg_name" {
    type        = string
}
variable "db_sg_name" {
    type        = string
}
variable "db_subnet" {
    type        = string
}
variable "lb_sg_name" {
    type        = string
}
variable "ami_id" {
    type        = string
}
variable "instance_type" {
    type        = string
}
variable "key_name" {
    type        = string
}
variable "lb_name" {
    type        = string
}
variable "tg_name" {
    type        = string
}
variable "db-username" {
    type        = string
}
variable "db-password" {
    type        = string
}
variable "db_name" {
    type        = string
}