provider "aws" {
  profile = "myprofile"
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type_md
  tags = {
    Name = "${var.instance_name_md}"
  }
  key_name = var.instance_key_md
}