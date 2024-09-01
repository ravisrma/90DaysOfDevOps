resource "aws_key_pair" "my-terraform-key" {
    key_name   = var.key_name
    public_key = file("~/.ssh/my-terraform-key.pub") 
}