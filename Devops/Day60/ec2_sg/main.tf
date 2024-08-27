resource "aws_instance" "firstec2" {
  ami           = var.ami
  key_name      = aws_key_pair.key.key_name
  instance_type = var.instance_type
  tags = {
    Name = "first_ec2"
  }
  vpc_security_group_ids = [aws_security_group.tfsg.id]
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
  file_permission = "0600"
}

resource "aws_security_group" "tfsg" {
  vpc_id = var.vpc_id
  name   = "tfsg"
  dynamic "ingress" {
    for_each = var.ports_list
    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]

    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}