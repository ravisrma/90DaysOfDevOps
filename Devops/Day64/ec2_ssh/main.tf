resource "aws_key_pair" "my_key" {
    key_name   = "my-terraform-key"
    public_key = file("~/.ssh/my-terraform-key.pub")  # Path to your public key file
    }

    resource "aws_instance" "my_instance" {
    ami           = "ami-0c2af51e265bd5e0e"  # Change to your desired AMI ID
    instance_type = "t2.micro"
    key_name      = aws_key_pair.my_key.key_name

    tags = {
        Name = "MyInstance"
    }
    }

    output "instance_ip" {
    value = aws_instance.my_instance.public_ip
}