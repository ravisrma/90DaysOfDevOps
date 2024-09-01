resource "aws_route_table_association" "my-terraform-route-table-assoc" {
    subnet_id      = aws_subnet.my-terraform-subnet.id
    route_table_id = aws_route_table.my-terraform-route-table.id
}