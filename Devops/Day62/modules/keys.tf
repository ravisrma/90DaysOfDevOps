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
  file_permission = "0600"
}