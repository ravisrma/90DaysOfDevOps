resource "aws_key_pair" "my_key" {
    key_name = var.key_name
    public_key = file("~/.ssh/my-terraform-key.pub")
}
resource "aws_instance" "my_instance-1" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.my_key.key_name
    subnet_id = aws_subnet.pub_subnet1.id
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    tags = {
        Name = "my-instance"
    }
    user_data = filebase64("user-data.sh")
}
resource "aws_instance" "my_instance-2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.my_key.key_name
    subnet_id = aws_subnet.pub_subnet2.id
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    tags = {
        Name = "my-instance"
    }
    user_data = filebase64("user-data.sh")
}