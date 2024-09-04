resource "aws_route_table_association" "myroutetableassociation1" {
    subnet_id = aws_subnet.mysubnet.id
    route_table_id = aws_route_table.myroutetable.id
}
resource "aws_route_table_association" "myroutetableassociation2" {
    subnet_id = aws_subnet.mysubnet2.id
    route_table_id = aws_route_table.myroutetable.id
}