resource "aws_vpc" "my-terraform-vpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "my-terraform-vpc"
    }
}