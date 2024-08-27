# variable "instance_id" {
#   description = "The instance ID"
#   type        = string
# }
variable "instance_type" {
  description = "The instance type"
  type        = string
}
variable "ami" {
  description = "The AMI ID"
  type        = string

}
variable "vpc_id" {
  description = "The VPC ID"
  type        = string

}
variable "ports_list" {
  description = "The list of ports to open"
  type        = list(number)

}