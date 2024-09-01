variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}
variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
}
# variable "key_name" {
#     description = "The key name to use for the instance"
#     type = string  
# }

# variable "instance_name" {
#   description = "The name of the instance"
#   type        = string
# }
# variable "key_name" {
#   description = "value of the key"
#   type        = string
# }

variable "vpc_security_group_ids" {
  description = "List of security group modules/ids to include for this AWS Instance"
  type        = list(string)
}