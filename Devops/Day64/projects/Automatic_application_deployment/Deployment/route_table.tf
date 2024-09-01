resource "aws_route_table" "my-terraform-route-table" {
    vpc_id = aws_vpc.my-terraform-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-terraform-igw.id
    }
}