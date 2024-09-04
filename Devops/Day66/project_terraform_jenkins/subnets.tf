resource "aws_subnet" "mysubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.pub_subnet1_cidr
    availability_zone = var.subnet1_az
    map_public_ip_on_launch = true
    tags = {
        Name = var.subnet1_az
}
}
resource "aws_subnet" "mysubnet2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.pub_subnet2_cidr
    availability_zone = var.subnet2_az
    map_public_ip_on_launch = true
    tags = {
        Name = var.subnet2_az
}
}

