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
resource "aws_instance" "firstec2" {
  ami           = var.ami
  key_name      = aws_key_pair.key.key_name
  instance_type = var.instance_type
  tags = {
    Name = "first_ec2"
  }
  vpc_security_group_ids = [aws_security_group.tfsg.id]
  
  connection {
    type        = "ssh"
    user        =  var.instance_default_user
    private_key =  tls_private_key.mykey.private_key_pem
    #private_key = file("${path.module}/tfkey.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo snap install tree -y",
      "echo 'hello ravi' >> /tmp/hello.txt"
    ]
  }
  provisioner "remote-exec" {
    on_failure = continue
    script = "nginx.sh"
  }
  provisioner "local-exec" {
    on_failure = fail
    #command = "scp -i tls_private_key.mykey.private_key_pem var.instance_default_user@${self.public_ip}:/tmp/hello.txt . "
    command = "scp -i ${path.module}/tfkey.pem ${var.instance_default_user}@${self.public_ip}:/tmp/hello.txt . "
  }
}
