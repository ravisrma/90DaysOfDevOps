
#ec2 sg
resource "aws_security_group" "my_sg" {
    vpc_id = aws_vpc.my_vpc.id
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"

    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        #security_groups = [aws_security_group.my_lb_sg.id]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        #security_groups = [aws_security_group.my_lb_sg.id]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    # egress {
    #     from_port = 3306
    #     to_port = 3306
    #     protocol = "tcp"
    #     security_groups = [aws_security_group.my_db_sg.id]
    #     self = false
    # }
    tags = {
        Name = var.sg_name
    }
}

