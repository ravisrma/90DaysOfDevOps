resource "aws_subnet" "my-terraform-subnet" {
    vpc_id     = aws_vpc.my-terraform-vpc.id
    availability_zone = var.subnet_az
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = true
}