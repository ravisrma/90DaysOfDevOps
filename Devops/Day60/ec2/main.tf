resource "aws_instance" "firstec2" {
  ami           = var.ami
  key_name = aws_key_pair.key.key_name
  instance_type = var.instance_type
  tags = {
    Name = "first_ec2"
  }
  vpc_security_group_ids = var.vpc_security_group_ids
}
resource "aws_key_pair" "key" {
  key_name   = "tfkey"
  public_key = tls_private_key.mykey.public_key_openssh
}
resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "tfkey" {
  content  = tls_private_key.mykey.private_key_pem
  filename = "${path.module}/tfkey.pem"
}