output "sg_id" {
  value = aws_security_group.tfsg.id

}
output "public_ip" {
  value = aws_instance.firstec2.public_ip

}
output "instance_id" {
  value = aws_instance.firstec2.id

}