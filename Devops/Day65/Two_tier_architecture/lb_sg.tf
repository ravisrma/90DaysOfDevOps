#lb sg
resource "aws_security_group" "my_lb_sg" {
    vpc_id = aws_vpc.my_vpc.id
    ingress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = var.lb_sg_name
    }
}