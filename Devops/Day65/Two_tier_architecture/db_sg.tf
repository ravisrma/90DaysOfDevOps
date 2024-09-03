
#db sg
resource "aws_security_group" "my_db_sg" {
    vpc_id = aws_vpc.my_vpc.id
    ingress {
        from_port = "3306"
        to_port = "3306"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        security_groups = [aws_security_group.my_sg.id]
    }
    ingress {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        security_groups = [aws_security_group.my_sg.id]
    }
    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = var.db_sg_name
    }
}